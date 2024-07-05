#[no_mangle]
pub fn alloc(size: usize) -> *mut u8 {
    let mut buf = Vec::with_capacity(size);
    let ptr = buf.as_mut_ptr();
    std::mem::forget(buf);
    ptr
}

#[no_mangle]
pub fn dealloc(ptr: *mut u8, size: usize) {
    unsafe {
        let _buf = Vec::from_raw_parts(ptr, 0, size);
    }
}

#[no_mangle]
pub fn print(str_ptr: *const u32) {
    let s = unsafe {
        let len = *str_ptr;
        let slice = std::slice::from_raw_parts(str_ptr.offset(1) as *const u8, len as usize);
        std::str::from_utf8(slice).unwrap()
    };
    println!("{}", s);
}

fn main() {}
