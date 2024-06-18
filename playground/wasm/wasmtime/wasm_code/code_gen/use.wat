(module
  (import "1" "memory" (memory 1))
  (import "1" "alloc" (func $alloc (param i32) (result i32)))
  (import "1" "dealloc" (func $dealloc (param i32 i32)))
  (type $ap0 (func (result i32)))
  (type $ap1 (func (param i32) (result i32)))
  (type $ap2 (func (param i32 i32) (result i32)))
  (table (export "table") 4 funcref)
  (elem (i32.const 0) $fn_app $value $mul $square)

  (func $fn_app (param $n i32) (param $ptr i32) (result i32)
    (if
      (i32.eq (i32.const 2) (local.get $n))
      (then
        (return (call_indirect (type $ap2)
          (i32.load offset=4 (local.get $ptr))
          (i32.load offset=8 (local.get $ptr))
          (i32.load (local.get $ptr)))))
      (else
        (if
          (i32.eq (i32.const 1) (local.get $n))
          (then
            (return (call_indirect (type $ap1)
              (i32.load offset=4 (local.get $ptr))
              (i32.load (local.get $ptr)))))
          (else
            (if
              (i32.eq (i32.const 0) (local.get $n))
              (then
                (return (call_indirect (type $ap0)
                  (i32.load (local.get $ptr)))))
              (else
                unreachable))))))
    (unreachable)
  )

  (func $value (param $x i32) (result i32)
    (local.get $x)
  )

  (func $make_closure (export "make_closure") (param $n i32) (param $env i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 9)))
    (i32.store8 (local.get $a) (i32.const 0))
    (i32.store offset=1 (local.get $a) (local.get $n))
    (i32.store offset=5 (local.get $a) (local.get $env))
    (local.get $a)
  )

  (func $make_env (export "make_env") (param $n i32) (param $fn i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc
      (i32.add (i32.const 4)
        (i32.mul
          (i32.const 4)
          (local.get $n)))))
    (i32.store (local.get $a) (local.get $fn))
    (local.get $a)
  )

  (func $make_val (export "make_val") (param $val i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 5)))
    (i32.store8 (local.get $a) (i32.const 1))
    (i32.store offset=1 (local.get $a) (local.get $val))
    (local.get $a)
  )

  (func $square (export "square") (param $x i32) (result i32)
    (local $a i32)

    (local.set $a (call $make_env (i32.const 2) (i32.const 2)))
    (i32.store offset=4 (local.get $a) (local.get $x))
    (i32.store offset=8 (local.get $a) (local.get $x))

    (return (call $make_closure (i32.const 2) (local.get $a)))
  )

  (func $mul (export "mul") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.mul
        (call $eval (local.get $x))
        (call $eval (local.get $y)))))
  )

  (func $eval (export "eval") (param $ptr i32) (result i32)
    (loop $loop
      (if
        (i32.ne (i32.const 0) (i32.load8_u (local.get $ptr)))
        (then
          (return (call $value
            (i32.load offset=1 (local.get $ptr)))))
        (else
          (local.set $ptr
            (call $fn_app
              (i32.load offset=1 (local.get $ptr))
              (i32.load offset=5 (local.get $ptr))))
          (br $loop)))
    )
    (unreachable)
  )
)
