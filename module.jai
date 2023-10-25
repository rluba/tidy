Jai_Tidy_Allocator :: struct {
    using #as base: TidyAllocator;
    ctx: Context;
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
