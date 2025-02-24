Jai_Tidy_Allocator :: struct {
    using #as base: TidyAllocator;
    ctx: #Context;
    allocator: Allocator;
    vtable: TidyAllocatorVtbl;
}

create_tidy_allocator :: () -> *TidyAllocator {
    tidy_allocator := New(Jai_Tidy_Allocator);
    tidy_allocator.ctx = context;
    remember_allocators(tidy_allocator);
    tidy_allocator.vtable.alloc = jai_tidy_alloc;
    tidy_allocator.vtable.realloc = jai_tidy_realloc;
    tidy_allocator.vtable.free = jai_tidy_free;
    tidy_allocator.vtable.panic = jai_tidy_panic;
    tidy_allocator.vtbl = *tidy_allocator.vtable;
    return tidy_allocator;
}

#load "unix.jai";

clean_node_text :: (input_text: string, remove_entities := true, preserve_newlines := false) -> string {
    text := input_text;
    if text.count text.count -= 1; // Remove the extra newline that tidy adds for some reason

    src := 0;
    dest := 0;
    for src: 0..text.count-1 {
        if !preserve_newlines && text[src] == #char "\n" {
            // Replace newlines since they are not significant in HTML
            text[dest] = #char " ";
            dest += 1;
        } else if remove_entities && text[src] == #char "&" {
            // Replace &amp; which is not replaced by tidy and remove all other HTML entities,
            // since you can’t decode them anymore once &amp; got replaced.
            start := src;
            end := src + 1;
            numeric: enum {
                NO;
                DEC;
                HEX;
            }
            valid := false;
            while end < text.count {
                c := text[end];
                if c == #char ";" {
                    entity := string.{count = end - start + 1, data = text.data + start};
                    log("Found entity at %-% in \"%\": %", start, end, text, entity);
                    if entity == "&amp;" {
                        text[dest] = #char "&";
                        dest += 1;
                    }
                    src = end;
                    valid = true;
                    break;
                }

                lower_c := c | 0x20; // Ascii to lower case

                if end == start + 1 && c == #char "#" {
                    assert(numeric == .NO);
                    numeric = .DEC;
                } else if numeric == .NO {
                    if lower_c < #char "a" || lower_c > #char "z" {
                        break; // not a real entity
                    }
                } else if end == start + 2 && lower_c == #char "x" {
                    assert(numeric == .DEC);
                    numeric = .HEX;
                } else {
                    if (c < #char "0" || c > #char "9") && (numeric == .DEC || lower_c < #char "a" || lower_c > #char "f") {
                        break; // not a real entity
                    }
                }
                end += 1;
            }
            if !valid {
                text[dest] = text[src];
                dest += 1;
            }
        } else {
            text[dest] = text[src];
            dest += 1;
        }
    }
    text.count = dest;

    return text;
}

//
// Helpers for debugging:
//

// Logs all nodes in the body
debug_log_nodes :: (doc: TidyDoc) {
    push_allocator(temp);
    builder: String_Builder;
    debug_append_node(*builder, doc, getBody(doc));
    log("Nodes: %", builder_to_string(*builder));
}

debug_append_node :: (builder: *String_Builder, doc: TidyDoc, node: TidyNode, indent := 0) {
    child := getChild(node);
    while child {
        defer child = getNext(child);

        name: string;
        node_type := nodeGetType(child);
        if node_type == {
            case .Text;
                for 1..indent append(builder, "    ");
                buffer: TidyBuffer;
                defer bufFree(*buffer);
                nodeGetText(doc, child, *buffer);
                text := to_string(buffer.bp);
                if text.count text.count -= 1; // Remove extra newline
                print_to_builder(builder, "%\n", text);

            case .Start; #through;
            case .StartEnd;
                for 1..indent append(builder, "    ");
                name = to_string(nodeGetName(child));
                print_to_builder(builder, "<%", name);

                attr := attrFirst(child);
                while attr {
                    defer attr = attrNext(attr);
                    name := to_string(attrName(attr));
                    value := to_string(attrValue(attr));
                    print_to_builder(builder, " %=\"%\"", name, value);
                }

                if node_type == .Start {
                    append(builder, ">\n");
                } else {
                    append(builder, "/>\n");
                }

            case .End;
                for 1..indent append(builder, "    ");
                name = to_string(nodeGetName(child));
                print_to_builder(builder, "</%>\n", name);
        }

        debug_append_node(builder, doc, child, indent + 1);

        if nodeGetType(child) == .Start {
            for 1..indent append(builder, "    ");
            print_to_builder(builder, "</%>\n", name);
        }
    }
}


#scope_file

jai_tidy_alloc ::(self: *TidyAllocator, nBytes: u64) -> *void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        push_allocator(allocator.allocator);
        to_allocate := cast(s64) nBytes + size_of(u64);
        result := alloc(to_allocate);
        return save_size_and_adjust(result, to_allocate);
    }
}

jai_tidy_realloc :: (self: *TidyAllocator, block: *void, nBytes: u64) -> *void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        push_allocator(allocator.allocator);
        real_base, old_size := get_real_start_and_size(block);
        to_allocate := cast(s64) nBytes + size_of(u64);
        result := realloc(real_base, to_allocate, old_size);
        return save_size_and_adjust(result, to_allocate);
    }
}

jai_tidy_free :: (self: *TidyAllocator, block: *void) -> void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        push_allocator(allocator.allocator);
        real_base := get_real_start_and_size(block);
        free(real_base);
    }
}

jai_tidy_panic :: (self: *TidyAllocator, msg: ctmbstr) -> void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        log_error("Tidy allocator panic: %", to_string(msg));
    }
}

// Store the size at the start of the allocation – or we can’t realloc!
save_size_and_adjust :: inline (block: *void, block_size: s64) -> *void {
    if !block return null;
    <<cast(*s64) block = block_size;
    return block + size_of(s64);
}

// Retrieve the stored size
get_real_start_and_size :: inline (adjusted_block: *void) -> *void, s64 {
    if !adjusted_block return null, 0;
    real_base := adjusted_block - size_of(s64);
    size := <<(cast(*s64) real_base);
    return real_base, size;
}

#import "POSIX";
