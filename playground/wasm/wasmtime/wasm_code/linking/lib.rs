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
pub fn copy(ptr: *mut u8, size: usize) -> *mut u8 {
    let new_ptr = alloc(size);
    unsafe {
        let src = std::slice::from_raw_parts(ptr, size);
        let dst = std::slice::from_raw_parts_mut(new_ptr, size);
        dst.copy_from_slice(src);
    }
    new_ptr
}

#[no_mangle]
pub fn create_closure(fn_index: u32, val: u32) -> *mut u8 {
    let closure = alloc(8);
    let env = alloc(4);

    unsafe {
        let buf = std::slice::from_raw_parts_mut(env, 4);
        buf.copy_from_slice(&val.to_le_bytes());

        let buf = std::slice::from_raw_parts_mut(closure, 8);
        buf[0..4].copy_from_slice(&fn_index.to_le_bytes());
        buf[4..8].copy_from_slice(&(env as u32).to_le_bytes());
    }
    closure
}

#[no_mangle]
pub fn test_write() -> *mut u8 {
    let ptr = alloc(10);

    // Do something with ptr
    unsafe {
        let buf = std::slice::from_raw_parts_mut(ptr, 10);
        for i in 0..10 {
            buf[i] = i as u8;
            println!("{}", buf[i]);
        }
    }

    ptr
}

#[no_mangle]
pub fn test_read(ptr: *mut u8) {
    unsafe {
        for i in 0..10 {
            println!("{}", ptr.add(i).read());
        }
    }
    dealloc(ptr, 10);
}

#[no_mangle]
fn main() {
    let ptr = test_write();
    test_read(ptr);
}
