(module
  (import "alloc" "memory" (memory 1))
  (import "alloc" "alloc" (func $alloc (param i32) (result i32)))
  (import "alloc" "dealloc" (func $dealloc (param i32 i32)))
  (type $ap0 (func (result i32)))
  (type $ap1 (func (param i32) (result i32)))
  (type $ap2 (func (param i32 i32) (result i32)))
  (table (export "table") 128 funcref)
  (elem (i32.const 0) $dummy) ;; will be overwritten be the merge

  (func $dummy (param i32 i32) (result i32)
    (unreachable)
  )

  (func $make_closure (export "make_closure") (param $ty_idx i32) (param $env i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 9)))
    (i32.store8 (local.get $a) (i32.const 0))
    (i32.store offset=1 (local.get $a) (local.get $ty_idx))
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

  (func $add (export "+") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.add
        (call $eval (local.get $x))
        (call $eval (local.get $y)))))
  )

  (func $minus (export "-") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.sub
        (call $eval (local.get $x))
        (call $eval (local.get $y)))))
  )


  (func $mul (export "*") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.mul
        (call $eval (local.get $x))
        (call $eval (local.get $y)))))
  )


  (func $div (export "/") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.div_s
        (call $eval (local.get $x))
        (call $eval (local.get $y)))))
  )


  (func $negate (export "negate") (param $x i32) (result i32)
    (return (call $make_val
      (i32.sub (i32.const 0) (call $eval (local.get $x)))))
  )


  (func $eval (export "eval") (param $ptr i32) (result i32)
    (loop $loop
      (if
        (i32.ne (i32.const 0) (i32.load8_u (local.get $ptr)))
        (then
          (return (i32.load offset=1 (local.get $ptr))))
        (else
          (local.set $ptr
            (call_indirect (type $ap2)
              (i32.load offset=1 (local.get $ptr))
              (i32.load offset=5 (local.get $ptr))
              (i32.const 0)))
          (br $loop))))

    (unreachable)
  )
)