(module
    (import "1" "memory" (memory 1))
    (import "1" "main" (func $main))
    (import "1" "alloc" (func $alloc (param i32) (result i32)))
    (import "1" "dealloc" (func $dealloc (param i32 i32)))
    (import "1" "create_closure" (func $create_closure (param i32 i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $n_main $main1)
    (type $t0 (func (param i32)))

    (func $main1 (param i32)
        call $main
    )

    (func $n_main (export "n_main") (param i32)
        (loop $n_main
            local.get 0
            i32.const 0
            i32.eq
            return

            call $main

            local.get 0
            i32.const 1
            i32.sub
            local.set 0
            br $n_main
        )
    )

    (func $use_closure (export "use_closure")
        call $use_closure1
        call $use_closure2
    )

    (func $use_closure1 (export "use_closure1") (result i32)
        i32.const 1
        i32.const 5
        call $create_closure
    )

    (func $use_closure2 (export "use_closure2") (param i32)
        local.get 0
        i32.load offset=4
        i32.load
        (call_indirect (type $t0) (i32.load (local.get 0)))
    )

    (func $write (export "write") (result i32 i32) (local i32)
        i32.const 4
        call $alloc
        local.set 0
        local.get 0
        i32.const 0x64636261
        i32.store
        local.get 0
        i32.const 4
    )

    (func $copy (export "copy") (param i32 i32) (result i32) (local i32)
        local.get 1
        call $alloc
        local.set 2

        (loop $copy
            local.get 2
            local.get 0
            i32.load
            i32.store

            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 1
            i32.const 1
            i32.sub
            local.set 1

            local.get 1
            i32.const 0
            i32.ne
            br_if $copy
        )

        local.get 2
    )
)
