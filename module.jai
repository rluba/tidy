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
        return alloc(cast(s64) nBytes);
    }
}

jai_tidy_realloc :: (self: *TidyAllocator, block: *void, nBytes: u64) -> *void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        push_allocator(allocator.allocator);
        return alloc(cast(s64) nBytes); // We can’t realloc without knowing the old size, so let’s just alloc 🙈
    }
}

jai_tidy_free :: (self: *TidyAllocator, block: *void) -> void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        push_allocator(allocator.allocator);
        free(block);
    }
}

jai_tidy_panic :: (self: *TidyAllocator, msg: ctmbstr) -> void #c_call {
    allocator := cast(*Jai_Tidy_Allocator) self;
    push_context allocator.ctx {
        log_error("Tidy allocator panic: %", to_string(msg));
    }
}

#import "POSIX";
