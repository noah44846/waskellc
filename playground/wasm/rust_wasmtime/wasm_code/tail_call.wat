(module
    (func $factorial (export "factorial") (param $x i64) (result i64)
        (return (call $factorial_aux (local.get $x) (i64.const 1)))
    )

    (func $factorial_aux (export "factorial_aux") (param $x i64) (param $acc i64) (result i64)
        (if (i64.eqz (local.get $x))
            (then (return (local.get $acc)))
            (else
                (return
                    (call $factorial_aux
                        (i64.sub (local.get $x) (i64.const 1))
                        (i64.mul (local.get $x) (local.get $acc))
                    )
                )
            )
        )
        unreachable
    )

    (func $factorial_tail (export "factorial_tail") (param $x i64) (result i64)
        (return_call $factorial_tail_aux (local.get $x) (i64.const 1))
    )

    (func $factorial_tail_aux (export "factorial_tail_aux") (param $x i64) (param $acc i64) (result i64)
        (if (i64.eqz (local.get $x))
            (then (return (local.get $acc)))
            (else
                (return_call $factorial_tail_aux
                    (i64.sub (local.get $x) (i64.const 1))
                    (i64.mul (local.get $x) (local.get $acc))
                )
            )
        )
        unreachable
    )
)
