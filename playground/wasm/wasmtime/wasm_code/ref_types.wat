(module
    (table 1 funcref)
    (type $t0 (func (result i32)))
    (type $t1 (func (param i32) (result i32)))

    (func $create_closure (export "create_closure") (result i32)
        i32.const 0
        ref.func $foo
        table.set 0
        i32.const 0
    )

    (func $foo (export "foo") (result i32)
        i32.const 42
    )

    (func $use_closure (export "use_closure") (result i32)
        call $create_closure
        call_indirect 0 (type $t0)
    )

    (func $bar (export "bar") (param i32) (result i32)
        local.get 0
    )

    (func $call (export "call") (param i32) (result i32)
        local.get 0
        ref.func $bar
        call $call_passed_func
    )

    (func $call_passed_func (export "call_passed_func") (param $a i32) (param $f (ref $t1)) (result i32)
        local.get $a
        local.get $f
        call_ref $t1
    )
)
