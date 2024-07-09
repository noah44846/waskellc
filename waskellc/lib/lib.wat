(module
  (import "rust_lib" "memory" (memory 1))
  (import "rust_lib" "alloc" (func $alloc (param i32) (result i32)))
  (import "rust_lib" "dealloc" (func $dealloc (param i32 i32)))
  (import "rust_lib" "rust_print" (func $print (param i32)))
  (type $ap0 (func (result i32)))
  (type $ap1 (func (param i32) (result i32)))
  (type $ap2 (func (param i32 i32) (result i32)))
  (table (export "table") 1024 funcref)
  (elem (i32.const 0) $dummy) ;; will be overwritten be the merge

  (func $dummy (param i32 i32) (result i32)
    (unreachable)
  )

  (func $make_env (export ":make_env") (param $n i32) (result i32)
    (local $a i32)
    (return (call $alloc
      (i32.add
        (i32.const 4)
        (i32.mul
          (i32.const 4)
          (local.get $n)))))
  )

  (func $make_thunk (export ":make_thunk") (param $ty_idx i32) (param $env i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 9)))
    (i32.store8 (local.get $a) (i32.const 2))
    (i32.store offset=1 (local.get $a) (local.get $ty_idx))
    (i32.store offset=5 (local.get $a) (local.get $env))
    (local.get $a)
  )

  (func $make_pap (export ":make_pap") (param $ty_idx i32) (param $n_total i32) (param $n_applied i32) (param $env i32) (result i32)
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

  (func $add_to_pap (export ":add_to_pap") (param $pap i32) (param $val i32) (result i32)
    (local $n_left i32)
    (local $pap_env_cursor i32)

    (local.set $pap (call $clone_pap (local.get $pap)))

    (if (i32.eq (i32.load offset=4 (local.get $pap)) (i32.const 0)) ;; trap if n_left is 0
      (then
        (unreachable)))

    (local.set $pap_env_cursor
      (i32.add
        (i32.load offset=12 (local.get $pap))  ;; load the pap's env
        (i32.load offset=8 (local.get $pap)))) ;; add the offset of where to add the param
    (i32.store (local.get $pap_env_cursor) (local.get $val))
    (i32.store offset=4 (local.get $pap) ;; decrement n_left
      (i32.sub
        (i32.load offset=4 (local.get $pap)) ;; n_left
        (i32.const 1)))
    (i32.store offset=8 (local.get $pap) ;; increment offset
      (i32.add
        (i32.load offset=8 (local.get $pap)) ;; offset
        (i32.const 4)))

    (local.get $pap)
  )

  (func $make_thunk_from_pap (export ":make_thunk_from_pap") (param $pap i32) (param $env i32) (result i32)
    (local $thunk i32)
    (local $n_left i32)
    (local $env_cursor i32)
    (local $pap_env_cursor i32)

    (local.set $pap (call $clone_pap (local.get $pap)))

    (local.set $thunk (call $make_thunk
      (i32.load (local.get $pap))               ;; function type index
      (i32.load offset=12 (local.get $pap))))   ;; env pointer

    (local.set $n_left (i32.load offset=4 (local.get $pap)))
    (local.set $env_cursor (local.get $env))
    (local.set $pap_env_cursor
      (i32.add
        (i32.load offset=12 (local.get $pap))   ;; load the pap's env
        (i32.load offset=8 (local.get $pap))))  ;; add the offset of where to add the remaining params
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

  (func $clone_pap (param $pap i32) (result i32)
    (local $new_pap i32)
    (local $n_left i32)
    (local $offset i32)
    (local $env_len i32)
    (local $env_cursor i32)
    (local $new_env i32)
    (local $new_env_cursor i32)

    (local.set $n_left (i32.load offset=4 (local.get $pap)))
    (local.set $offset (i32.load offset=8 (local.get $pap)))
    (local.set $env_len (i32.sub
        (i32.add
          (local.get $n_left)
          (i32.div_s
            (local.get $offset)
            (i32.const 4)))
        (i32.const 1)))

    (local.set $new_pap (call $alloc (i32.const 16)))
    (i32.store (local.get $new_pap) (i32.load (local.get $pap)))    ;; copy the function type index
    (i32.store offset=4 (local.get $new_pap) (local.get $n_left))   ;; copy n_left
    (i32.store offset=8 (local.get $new_pap) (local.get $offset))   ;; copy offset
    (local.set $new_env (call $make_env (local.get $env_len)))      ;; create a new env
    (i32.store offset=12 (local.get $new_pap) (local.get $new_env)) ;; set the new env pointer

    (local.set $env_cursor (i32.load offset=12 (local.get $pap)))
    (local.set $new_env_cursor (local.get $new_env))
    (loop $loop
      (if
        (i32.eq (local.get $env_len) (i32.const 0))
        (then
          (return (local.get $new_pap)))
        (else
          (i32.store (local.get $new_env_cursor) (i32.load (local.get $env_cursor)))
          (local.set $env_cursor (i32.add (local.get $env_cursor) (i32.const 4)))
          (local.set $new_env_cursor (i32.add (local.get $new_env_cursor) (i32.const 4)))
          (local.set $env_len (i32.sub (local.get $env_len) (i32.const 1)))
          (br $loop))))

    (unreachable)
  )

  (func $make_val (export ":make_val") (param $type i32) (param $val i32) (result i32)
    (local $a i32)
    (local.set $a (call $alloc (i32.const 5)))
    (i32.store8 (local.get $a) (local.get $type))
    (i32.store offset=1 (local.get $a) (local.get $val))
    (local.get $a)
  )

  (func (export "panic") (param $ptr i32) (result i32)
    (drop (call $full_eval (local.get $ptr)))
    (unreachable)
  )

  (func (export "print") (param $ptr i32) (result i32)
    (local.set $ptr (call $full_eval (local.get $ptr)))
    (call $print (local.get $ptr))
    (local.set $ptr (call $make_env (i32.const 1)))
    (i32.store (local.get $ptr) (i32.const 0))
    (i32.store offset=4 (local.get $ptr) (i32.const 0))
    (call $make_val (i32.const 1) (local.get $ptr))
  )

  (func (export "negate") (param $x i32) (result i32)
    (return (call $make_val
      (i32.const 0)
      (i32.mul
        (call $full_eval (local.get $x))
        (i32.const -1))))
  )

  (func (export "+") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.const 0)
      (i32.add
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y)))))
  )

  (func (export "-") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.const 0)
      (i32.sub
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y)))))
  )


  (func (export "*") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.const 0)
      (i32.mul
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y)))))
  )

  (func (export "==") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (i32.store (local.get $a) (i32.const 0))
    (i32.store offset=4
      (local.get $a)
      (i32.ne
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export "/=") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (i32.store (local.get $a) (i32.const 0))
    (i32.store offset=4
      (local.get $a)
      (i32.eq
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export "<") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (i32.store (local.get $a) (i32.const 0))
    (i32.store offset=4
      (local.get $a)
      (i32.ge_s
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export ">") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (i32.store (local.get $a) (i32.const 0))
    (i32.store offset=4
      (local.get $a)
      (i32.le_s
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export "<=") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (i32.store (local.get $a) (i32.const 0))
    (i32.store offset=4
      (local.get $a)
      (i32.gt_s
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export ">=") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (i32.store (local.get $a) (i32.const 0))
    (i32.store offset=4
      (local.get $a)
      (i32.lt_s
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export "compare") (param $x i32) (param $y i32) (result i32)
    (local $a i32)
    (local.set $a (call $make_env (i32.const 1)))
    (local.set $x (call $full_eval (local.get $x)))
    (local.set $y (call $full_eval (local.get $y)))
    (i32.store (local.get $a) (i32.const 0))
    (if
      (i32.lt_s (local.get $x) (local.get $y))
      (then
        (i32.store offset=4 (local.get $a) (i32.const 0)))
      (else
        (if
          (i32.eq (local.get $x) (local.get $y))
          (then
            (i32.store offset=4 (local.get $a) (i32.const 1)))
          (else
            (i32.store offset=4 (local.get $a) (i32.const 2))))))
    (return (call $make_val (i32.const 1) (local.get $a)))
  )

  (func (export "quot") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.const 0)
      (i32.div_s
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y)))))
  )

  (func (export "rem") (param $x i32) (param $y i32) (result i32)
    (return (call $make_val
      (i32.const 0)
      (i32.rem_s
        (call $full_eval (local.get $x))
        (call $full_eval (local.get $y)))))
  )

  (func (export "intToChar") (param $x i32) (result i32)
    (local.get $x)
  )

  (func $eval (export ":eval") (param $ptr i32) (result i32)
    (loop $loop
      (if
        (i32.ne (i32.const 2) (i32.load8_u (local.get $ptr)))
        (then
          (return (local.get $ptr)))
        (else
          (local.set $ptr
            (call_indirect (type $ap2)
              (i32.load offset=1 (local.get $ptr))
              (i32.load offset=5 (local.get $ptr))
              (i32.const 0)))
          (br $loop))))

    (unreachable)
  )

  (func $full_eval (export ":full_eval") (param $ptr i32) (result i32)
    (local $evaluated i32)
    (local $env i32)
    (local $len i32)
    (local $cursor i32)

    (local.set $evaluated (call $eval
      (local.get $ptr)))

    (if
      (i32.eq (i32.const 0) (i32.load8_u (local.get $evaluated)))
      (then
        (return (i32.load offset=1 (local.get $evaluated))))
      (else
        (local.set $env (i32.load offset=1 (local.get $evaluated)))     ;; get the env
        (local.set $len (i32.load (local.get $env)))                    ;; get the length of the env
        (local.set $cursor (i32.add (local.get $env) (i32.const 8)))    ;; set the cursor to the first element of the env (after the length and the constructor index)
        (loop $loop
          (if
            (i32.eq (local.get $len) (i32.const 0))
            (then
              (return (local.get $env)))
            (else
              (i32.store (local.get $cursor) (call $full_eval (i32.load (local.get $cursor))))
              (local.set $cursor (i32.add (local.get $cursor) (i32.const 4)))
              (local.set $len (i32.sub (local.get $len) (i32.const 1)))
              (br $loop))))))

    (unreachable)
  )
)
