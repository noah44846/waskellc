(module
    (memory (export "memory") 1)
    (func (export "f") (result i32)
        i32.const 0
        i32.const 8
        i32.store
        i32.const 4
        i32.const 13
        i32.store
        i32.const 0
    )
    (data (i32.const 8) "Hello, World!")
)
