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
pub fn rust_print(waskell_str_ptr: *const u32) {
    let mut waskell_str_ptr = waskell_str_ptr;
    let s = unsafe {
        let mut s = Vec::new();
        let elem_ty = *(waskell_str_ptr.offset(1));
        if elem_ty == 0 {
            println!("");
            return;
        }
        s.push(char::from_u32(*waskell_str_ptr.offset(2)).unwrap());
        waskell_str_ptr = (*waskell_str_ptr.offset(3)) as *const u32;
        loop {
            let elem_ty = *waskell_str_ptr.offset(1);
            if elem_ty == 0 {
                break;
            }
            let elem = char::from_u32(*waskell_str_ptr.offset(2)).unwrap();
            s.push(elem);
            waskell_str_ptr = (*waskell_str_ptr.offset(3)) as *const u32;
        }
        s.into_iter().collect::<String>()
    };
    println!("{}", s);
}

fn main() {}
