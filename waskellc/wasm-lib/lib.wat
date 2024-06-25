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

  (func $make_env (export "make_env") (param $n i32) (result i32)
    (local $a i32)
    (return (call $alloc
      (i32.add
        (i32.const 4)
        (i32.mul
          (i32.const 4)
          (local.get $n)))))
  )

  (func $make_thunk (export "make_thunk") (param $ty_idx i32) (param $env i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 9)))
    (i32.store8 (local.get $a) (i32.const 1))
    (i32.store offset=1 (local.get $a) (local.get $ty_idx))
    (i32.store offset=5 (local.get $a) (local.get $env))
    (local.get $a)
  )

  (func $make_pap (export "make_pap") (param $ty_idx i32) (param $n_total i32) (param $n_applied i32) (param $env i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 16)))
    (i32.store (local.get $a) (local.get $ty_idx))          ;; function type index
    (i32.store offset=4 (local.get $a)                      ;; n_left
      (i32.sub
        (local.get $n_total)
        (local.get $n_applied)))
    (i32.store offset=8 (local.get $a)                      ;; offset to where to add the remaining params
      (i32.add
        (i32.mul
          (local.get $n_applied)
          (i32.const 4))
        (i32.const 4)))
    (i32.store offset=12 (local.get $a) (local.get $env))   ;; env pointer
    (local.get $a)
  )

  (func $make_thunk_from_pap (export "make_thunk_from_pap") (param $pap i32) (param $env i32) (result i32)
    (local $thunk i32)
    (local $n_left i32)
    (local $env_cursor i32)
    (local $pap_env_cursor i32)
    (local.set $thunk (call $make_thunk
      (i32.load (local.get $pap))               ;; function type index
      (i32.load offset=12 (local.get $pap))))   ;; env pointer

    (local.set $n_left (i32.load offset=4 (local.get $pap)))
    (local.set $env_cursor (local.get $env))
    (local.set $pap_env_cursor
      (i32.add
        (i32.load offset=12 (local.get $pap))   ;; load the pap's env
        (i32.load offset=8 (local.get $pap)))) ;; add the offset of where to add the remaining params
    (loop $loop
      (if
        (i32.eq (local.get $n_left) (i32.const 0))
        (then
          (return (local.get $thunk)))
        (else
          (i32.store (local.get $pap_env_cursor) (i32.load (local.get $env_cursor)))
          (local.set $n_left (i32.sub (local.get $n_left) (i32.const 1)))
          (local.set $pap_env_cursor
            (i32.add (local.get $pap_env_cursor) (i32.const 4)))
          (local.set $env_cursor
            (i32.add (local.get $env_cursor) (i32.const 4)))
          (br $loop))))

    (unreachable)
  )

  (func $make_val (export "make_val") (param $val i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 5)))
    (i32.store8 (local.get $a) (i32.const 0))
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
        (i32.ne (i32.const 1) (i32.load8_u (local.get $ptr)))
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
