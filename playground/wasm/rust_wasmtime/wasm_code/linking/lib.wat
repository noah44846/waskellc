(module $lib.wasm
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;10;) (func (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;16;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;17;) (func (param i64 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17h99c3efa82f72b951E (;0;) (type 7)))
  (import "wasi_snapshot_preview1" "environ_get" (func $__imported_wasi_snapshot_preview1_environ_get (;1;) (type 4)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func $__imported_wasi_snapshot_preview1_environ_sizes_get (;2;) (type 4)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (;3;) (type 1)))
  (func $__wasm_call_ctors (;4;) (type 0))
  (func $_start (;5;) (type 0)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=1057240
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1057240
        call $__wasm_call_ctors
        call $__main_void
        local.set 0
        call $__wasm_call_dtors
        local.get 0
        br_if 1 (;@1;)
        return
      end
      unreachable
      unreachable
    end
    local.get 0
    call $__wasi_proc_exit
    unreachable
  )
  (func $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17he17d94e7492cbfd0E (;6;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 5
    i32.const 32
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 7
    local.get 3
    i32.store offset=8
    local.get 7
    local.get 4
    i32.store offset=12
    local.get 7
    i32.load offset=12
    local.set 8
    local.get 1
    local.get 2
    local.get 8
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut18precondition_check17h2143232356bd8112E
    local.get 2
    local.get 1
    i32.sub
    local.set 9
    local.get 3
    local.get 1
    i32.add
    local.set 10
    local.get 7
    local.get 10
    i32.store offset=24
    local.get 7
    local.get 9
    i32.store offset=28
    local.get 7
    i32.load offset=24
    local.set 11
    local.get 7
    i32.load offset=28
    local.set 12
    local.get 7
    local.get 11
    i32.store offset=16
    local.get 7
    local.get 12
    i32.store offset=20
    local.get 7
    i32.load offset=16
    local.set 13
    local.get 7
    i32.load offset=20
    local.set 14
    local.get 0
    local.get 14
    i32.store offset=4
    local.get 0
    local.get 13
    i32.store
    i32.const 32
    local.set 15
    local.get 7
    local.get 15
    i32.add
    local.set 16
    local.get 16
    global.set $__stack_pointer
    return
  )
  (func $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut18precondition_check17h2143232356bd8112E (;7;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    local.set 3
    local.get 0
    local.set 4
    local.get 3
    local.get 4
    i32.ge_u
    local.set 5
    i32.const 1
    local.set 6
    local.get 5
    local.get 6
    i32.and
    local.set 7
    block ;; label = @1
      local.get 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.set 8
      local.get 2
      local.set 9
      local.get 8
      local.get 9
      i32.le_u
      local.set 10
      i32.const 1
      local.set 11
      local.get 10
      local.get 11
      i32.and
      local.set 12
      local.get 12
      i32.eqz
      br_if 0 (;@1;)
      return
    end
    i32.const 1048576
    local.set 13
    i32.const 101
    local.set 14
    local.get 13
    local.get 14
    call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
    unreachable
  )
  (func $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hed0d2e3423b175c1E (;8;) (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 6
    i32.const 16
    local.set 7
    local.get 6
    local.get 7
    i32.sub
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 1
    local.set 9
    local.get 2
    local.set 10
    local.get 9
    local.get 10
    i32.gt_u
    local.set 11
    i32.const 1
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 13
          br_if 0 (;@3;)
          local.get 2
          local.set 14
          local.get 4
          local.set 15
          local.get 14
          local.get 15
          i32.gt_u
          local.set 16
          i32.const 1
          local.set 17
          local.get 16
          local.get 17
          i32.and
          local.set 18
          local.get 18
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 1
        local.get 2
        local.get 5
        call $_ZN4core5slice5index22slice_index_order_fail17h0c75fe71e7929cd1E
        unreachable
      end
      i32.const 8
      local.set 19
      local.get 8
      local.get 19
      i32.add
      local.set 20
      local.get 20
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17he17d94e7492cbfd0E
      local.get 8
      i32.load offset=8
      local.set 21
      local.get 8
      i32.load offset=12
      local.set 22
      local.get 0
      local.get 22
      i32.store offset=4
      local.get 0
      local.get 21
      i32.store
      i32.const 16
      local.set 23
      local.get 8
      local.get 23
      i32.add
      local.set 24
      local.get 24
      global.set $__stack_pointer
      return
    end
    local.get 2
    local.get 4
    local.get 5
    call $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE
    unreachable
  )
  (func $_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h6b6db08d485cb1eeE (;9;) (type 1) (param i32)
    local.get 0
    call $_ZN4core3ops8function6FnOnce9call_once17h8c3ec50c9229153fE
    return
  )
  (func $_ZN4core3ops8function6FnOnce9call_once17h8c3ec50c9229153fE (;10;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 0
    call_indirect (type 0)
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    global.set $__stack_pointer
    return
  )
  (func $_ZN3std2rt10lang_start17h3d0237fd07e110ebE (;11;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=12
    i32.const 12
    local.set 7
    local.get 6
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    i32.const 1048680
    local.set 10
    local.get 9
    local.get 10
    local.get 1
    local.get 2
    local.get 3
    call $_ZN3std2rt19lang_start_internal17h8f61396649e22e0eE
    local.set 11
    local.get 6
    local.get 11
    i32.store offset=8
    local.get 6
    i32.load offset=8
    local.set 12
    i32.const 16
    local.set 13
    local.get 6
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return
  )
  (func $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h03763b9857f67c1dE (;12;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h6b6db08d485cb1eeE
    call $_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h9fb9ac01f47904d0E
    local.set 5
    i32.const 1
    local.set 6
    local.get 5
    local.get 6
    i32.and
    local.set 7
    local.get 3
    local.get 7
    i32.store8 offset=15
    local.get 3
    i32.load8_u offset=15
    local.set 8
    i32.const 1
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    i32.const 16
    local.set 11
    local.get 3
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    local.get 10
    return
  )
  (func $_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h9fb9ac01f47904d0E (;13;) (type 10) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    return
  )
  (func $_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17hb3c5c60f01660ec8E (;14;) (type 4) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    local.get 2
    return
  )
  (func $_ZN4core10intrinsics17is_nonoverlapping7runtime17h82fad83f76477411E (;15;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i64 i64 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 3
    i64.extend_i32_u
    local.set 7
    local.get 2
    i64.extend_i32_u
    local.set 8
    local.get 8
    local.get 7
    i64.mul
    local.set 9
    i64.const 32
    local.set 10
    local.get 9
    local.get 10
    i64.shr_u
    local.set 11
    local.get 11
    i32.wrap_i64
    local.set 12
    i32.const 0
    local.set 13
    local.get 12
    local.get 13
    i32.ne
    local.set 14
    local.get 9
    i32.wrap_i64
    local.set 15
    i32.const 1
    local.set 16
    local.get 14
    local.get 16
    i32.and
    local.set 17
    local.get 6
    local.get 17
    i32.store8 offset=15
    local.get 6
    i32.load8_u offset=15
    local.set 18
    i32.const 1
    local.set 19
    local.get 18
    local.get 19
    i32.and
    local.set 20
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 20
            br_if 0 (;@4;)
            local.get 6
            local.get 15
            i32.store offset=4
            i32.const 1
            local.set 21
            local.get 6
            local.get 21
            i32.store
            local.get 6
            i32.load offset=4
            local.set 22
            local.get 0
            local.set 23
            local.get 1
            local.set 24
            local.get 23
            local.get 24
            i32.lt_u
            local.set 25
            i32.const 1
            local.set 26
            local.get 25
            local.get 26
            i32.and
            local.set 27
            local.get 27
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          i32.const 1048704
          local.set 28
          i32.const 61
          local.set 29
          local.get 28
          local.get 29
          call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
          unreachable
        end
        local.get 0
        local.get 1
        i32.sub
        local.set 30
        local.get 6
        local.get 30
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.sub
      local.set 31
      local.get 6
      local.get 31
      i32.store offset=8
    end
    local.get 6
    i32.load offset=8
    local.set 32
    local.get 32
    local.set 33
    local.get 22
    local.set 34
    local.get 33
    local.get 34
    i32.ge_u
    local.set 35
    i32.const 1
    local.set 36
    local.get 35
    local.get 36
    i32.and
    local.set 37
    i32.const 16
    local.set 38
    local.get 6
    local.get 38
    i32.add
    local.set 39
    local.get 39
    global.set $__stack_pointer
    local.get 37
    return
  )
  (func $_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h9e76b637aff5fd19E (;16;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 3
    call $_ZN4core10intrinsics23is_aligned_and_not_null17hb9c5c3ea86a987d5E
    local.set 5
    i32.const 1
    local.set 6
    local.get 5
    local.get 6
    i32.and
    local.set 7
    block ;; label = @1
      local.get 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 3
      call $_ZN4core10intrinsics23is_aligned_and_not_null17hb9c5c3ea86a987d5E
      local.set 8
      i32.const 1
      local.set 9
      local.get 8
      local.get 9
      i32.and
      local.set 10
      local.get 10
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      local.get 4
      call $_ZN4core10intrinsics17is_nonoverlapping7runtime17h82fad83f76477411E
      local.set 11
      i32.const 1
      local.set 12
      local.get 11
      local.get 12
      i32.and
      local.set 13
      block ;; label = @2
        local.get 13
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      return
    end
    i32.const 1048765
    local.set 14
    i32.const 166
    local.set 15
    local.get 14
    local.get 15
    call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
    unreachable
  )
  (func $_ZN4core10intrinsics23is_aligned_and_not_null17hb9c5c3ea86a987d5E (;17;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        local.get 4
        local.get 5
        i32.store8 offset=3
        br 1 (;@1;)
      end
      local.get 1
      i32.popcnt
      local.set 6
      local.get 4
      local.get 6
      i32.store offset=28
      local.get 4
      i32.load offset=28
      local.set 7
      i32.const 1
      local.set 8
      local.get 7
      local.set 9
      local.get 8
      local.set 10
      local.get 9
      local.get 10
      i32.eq
      local.set 11
      i32.const 1
      local.set 12
      local.get 11
      local.get 12
      i32.and
      local.set 13
      block ;; label = @2
        local.get 13
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        local.set 14
        local.get 1
        local.get 14
        i32.sub
        local.set 15
        local.get 0
        local.get 15
        i32.and
        local.set 16
        i32.const 0
        local.set 17
        local.get 16
        local.set 18
        local.get 17
        local.set 19
        local.get 18
        local.get 19
        i32.eq
        local.set 20
        i32.const 1
        local.set 21
        local.get 20
        local.get 21
        i32.and
        local.set 22
        local.get 4
        local.get 22
        i32.store8 offset=3
        br 1 (;@1;)
      end
      i32.const 1048976
      local.set 23
      local.get 4
      local.get 23
      i32.store offset=4
      i32.const 1
      local.set 24
      local.get 4
      local.get 24
      i32.store offset=8
      i32.const 0
      local.set 25
      local.get 25
      i32.load offset=1048984
      local.set 26
      i32.const 0
      local.set 27
      local.get 27
      i32.load offset=1048988
      local.set 28
      local.get 4
      local.get 26
      i32.store offset=20
      local.get 4
      local.get 28
      i32.store offset=24
      i32.const 1048984
      local.set 29
      local.get 4
      local.get 29
      i32.store offset=12
      i32.const 0
      local.set 30
      local.get 4
      local.get 30
      i32.store offset=16
      i32.const 4
      local.set 31
      local.get 4
      local.get 31
      i32.add
      local.set 32
      local.get 32
      local.set 33
      i32.const 1049076
      local.set 34
      local.get 33
      local.get 34
      call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
      unreachable
    end
    local.get 4
    i32.load8_u offset=3
    local.set 35
    i32.const 1
    local.set 36
    local.get 35
    local.get 36
    i32.and
    local.set 37
    i32.const 32
    local.set 38
    local.get 4
    local.get 38
    i32.add
    local.set 39
    local.get 39
    global.set $__stack_pointer
    local.get 37
    return
  )
  (func $_ZN4core3fmt9Arguments6new_v117hf4821840569104c7E (;18;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 5
    i32.const 32
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 2
    local.set 8
    local.get 4
    local.set 9
    local.get 8
    local.get 9
    i32.lt_u
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    block ;; label = @1
      local.get 12
      br_if 0 (;@1;)
      i32.const 1
      local.set 13
      local.get 4
      local.get 13
      i32.add
      local.set 14
      local.get 2
      local.set 15
      local.get 14
      local.set 16
      local.get 15
      local.get 16
      i32.gt_u
      local.set 17
      i32.const 1
      local.set 18
      local.get 17
      local.get 18
      i32.and
      local.set 19
      block ;; label = @2
        local.get 19
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store
        local.get 0
        local.get 2
        i32.store offset=4
        i32.const 0
        local.set 20
        local.get 20
        i32.load offset=1048984
        local.set 21
        i32.const 0
        local.set 22
        local.get 22
        i32.load offset=1048988
        local.set 23
        local.get 0
        local.get 21
        i32.store offset=16
        local.get 0
        local.get 23
        i32.store offset=20
        local.get 0
        local.get 3
        i32.store offset=8
        local.get 0
        local.get 4
        i32.store offset=12
        i32.const 32
        local.set 24
        local.get 7
        local.get 24
        i32.add
        local.set 25
        local.get 25
        global.set $__stack_pointer
        return
      end
    end
    i32.const 1049104
    local.set 26
    local.get 7
    local.get 26
    i32.store offset=8
    i32.const 1
    local.set 27
    local.get 7
    local.get 27
    i32.store offset=12
    i32.const 0
    local.set 28
    local.get 28
    i32.load offset=1048984
    local.set 29
    i32.const 0
    local.set 30
    local.get 30
    i32.load offset=1048988
    local.set 31
    local.get 7
    local.get 29
    i32.store offset=24
    local.get 7
    local.get 31
    i32.store offset=28
    i32.const 1048984
    local.set 32
    local.get 7
    local.get 32
    i32.store offset=16
    i32.const 0
    local.set 33
    local.get 7
    local.get 33
    i32.store offset=20
    i32.const 8
    local.set 34
    local.get 7
    local.get 34
    i32.add
    local.set 35
    local.get 35
    local.set 36
    i32.const 1049188
    local.set 37
    local.get 36
    local.get 37
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core3mem6forget17h14b5f0733dcc2c85E (;19;) (type 1) (param i32)
    return
  )
  (func $_ZN4core3num21_$LT$impl$u20$u32$GT$11to_le_bytes17hd3abb6bae2878ab8E (;20;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12 align=1
    local.get 3
    i32.load offset=12 align=1
    local.set 4
    local.get 4
    return
  )
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h339466471c0055a2E (;21;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $_ZN4core3ops8function6FnOnce9call_once17ha2a07dc2e3f86d22E
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return
  )
  (func $_ZN4core3ops8function6FnOnce9call_once17ha2a07dc2e3f86d22E (;22;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    i32.const 8
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 6
    call $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h03763b9857f67c1dE
    local.set 7
    i32.const 16
    local.set 8
    local.get 3
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return
  )
  (func $_ZN4core3ptr13read_volatile18precondition_check17h43cd3ea6748ae625E (;23;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    call $_ZN4core10intrinsics23is_aligned_and_not_null17hb9c5c3ea86a987d5E
    local.set 2
    i32.const 1
    local.set 3
    local.get 2
    local.get 3
    i32.and
    local.set 4
    block ;; label = @1
      local.get 4
      br_if 0 (;@1;)
      i32.const 1049204
      local.set 5
      i32.const 110
      local.set 6
      local.get 5
      local.get 6
      call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
      unreachable
    end
    return
  )
  (func $_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h64d70a5a367011bbE (;24;) (type 1) (param i32)
    local.get 0
    call $_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hc1fbb887628cb41bE
    local.get 0
    call $_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hb1f13b453e7f85eeE
    return
  )
  (func $_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hc1fbb887628cb41bE (;25;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 0
    i32.load offset=4
    local.set 4
    local.get 0
    i32.load offset=8
    local.set 5
    local.get 3
    local.get 4
    i32.store offset=8
    local.get 3
    local.get 5
    i32.store offset=12
    local.get 3
    i32.load offset=8
    local.set 6
    local.get 3
    i32.load offset=12
    local.set 7
    local.get 3
    local.get 6
    i32.store
    local.get 3
    local.get 7
    i32.store offset=4
    return
  )
  (func $_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hb1f13b453e7f85eeE (;26;) (type 1) (param i32)
    local.get 0
    call $_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hba6691d5d15803c5E
    return
  )
  (func $_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hba6691d5d15803c5E (;27;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    i32.const 4
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 6
    local.get 0
    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h068377b33ed2974bE
    local.get 3
    i32.load offset=8
    local.set 7
    i32.const 0
    local.set 8
    i32.const 1
    local.set 9
    local.get 9
    local.get 8
    local.get 7
    select
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.set 12
    local.get 11
    local.set 13
    local.get 12
    local.get 13
    i32.eq
    local.set 14
    i32.const 1
    local.set 15
    local.get 14
    local.get 15
    i32.and
    local.set 16
    block ;; label = @1
      local.get 16
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.set 17
      local.get 3
      i32.load offset=8
      local.set 18
      local.get 3
      i32.load offset=12
      local.set 19
      i32.const 8
      local.set 20
      local.get 0
      local.get 20
      i32.add
      local.set 21
      local.get 21
      local.get 17
      local.get 18
      local.get 19
      call $_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h288f57b37634a2f9E
    end
    i32.const 16
    local.set 22
    local.get 3
    local.get 22
    i32.add
    local.set 23
    local.get 23
    global.set $__stack_pointer
    return
  )
  (func $_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h17d4e97ed95a929bE (;28;) (type 1) (param i32)
    return
  )
  (func $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E (;29;) (type 1) (param i32)
    (local i32 i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 1049314
      local.set 1
      i32.const 93
      local.set 2
      local.get 1
      local.get 2
      call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
      unreachable
    end
    return
  )
  (func $_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hee404bf6a04169ccE (;30;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    i32.const 8
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.get 1
    call $_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h9e78ae0c6c7c9a80E
    local.get 4
    i32.load offset=8
    local.set 7
    local.get 4
    i32.load offset=12
    local.set 8
    local.get 0
    local.get 8
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store
    i32.const 16
    local.set 9
    local.get 4
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    return
  )
  (func $_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h9e78ae0c6c7c9a80E (;31;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 1
    i32.load
    local.set 5
    local.get 1
    i32.load offset=4
    local.set 6
    local.get 5
    local.set 7
    local.get 6
    local.set 8
    local.get 7
    local.get 8
    i32.lt_u
    local.set 9
    i32.const 1
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    block ;; label = @1
      block ;; label = @2
        local.get 11
        br_if 0 (;@2;)
        i32.const 0
        local.set 12
        local.get 4
        local.get 12
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      i32.load
      local.set 13
      i32.const 1
      local.set 14
      local.get 13
      local.get 14
      call $_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17hb3c5c60f01660ec8E
      local.set 15
      local.get 1
      local.get 15
      i32.store
      local.get 4
      local.get 13
      i32.store offset=12
      i32.const 1
      local.set 16
      local.get 4
      local.get 16
      i32.store offset=8
    end
    local.get 4
    i32.load offset=8
    local.set 17
    local.get 4
    i32.load offset=12
    local.set 18
    local.get 0
    local.get 18
    i32.store offset=4
    local.get 0
    local.get 17
    i32.store
    i32.const 16
    local.set 19
    local.get 4
    local.get 19
    i32.add
    local.set 20
    local.get 20
    global.set $__stack_pointer
    return
  )
  (func $_ZN4core5alloc6layout6Layout5array5inner17hc213331b74f95680E (;32;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 32
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 2
        i32.store offset=24
        local.get 6
        i32.load offset=24
        local.set 7
        i32.const 1
        local.set 8
        local.get 7
        local.get 8
        i32.sub
        local.set 9
        i32.const 2147483647
        local.set 10
        local.get 10
        local.get 9
        i32.sub
        local.set 11
        i32.const 0
        local.set 12
        local.get 1
        local.set 13
        local.get 12
        local.set 14
        local.get 13
        local.get 14
        i32.eq
        local.set 15
        i32.const 1
        local.set 16
        local.get 15
        local.get 16
        i32.and
        local.set 17
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 17
              br_if 0 (;@5;)
              local.get 11
              local.get 1
              i32.div_u
              local.set 18
              local.get 3
              local.set 19
              local.get 18
              local.set 20
              local.get 19
              local.get 20
              i32.gt_u
              local.set 21
              i32.const 1
              local.set 22
              local.get 21
              local.get 22
              i32.and
              local.set 23
              local.get 23
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            i32.const 1049504
            local.set 24
            i32.const 25
            local.set 25
            i32.const 1049488
            local.set 26
            local.get 24
            local.get 25
            local.get 26
            call $_ZN4core9panicking5panic17h0d08f040be55464aE
            unreachable
          end
          br 1 (;@2;)
        end
        i32.const 0
        local.set 27
        local.get 27
        i32.load offset=1048984
        local.set 28
        i32.const 0
        local.set 29
        local.get 29
        i32.load offset=1048988
        local.set 30
        local.get 6
        local.get 28
        i32.store offset=8
        local.get 6
        local.get 30
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 1
      local.get 3
      i32.mul
      local.set 31
      local.get 6
      local.get 2
      i32.store offset=28
      local.get 6
      i32.load offset=28
      local.set 32
      local.get 6
      local.get 31
      i32.store offset=20
      local.get 6
      local.get 32
      i32.store offset=16
      local.get 6
      i32.load offset=16
      local.set 33
      local.get 6
      i32.load offset=20
      local.set 34
      local.get 6
      local.get 33
      i32.store offset=8
      local.get 6
      local.get 34
      i32.store offset=12
    end
    local.get 6
    i32.load offset=8
    local.set 35
    local.get 6
    i32.load offset=12
    local.set 36
    local.get 0
    local.get 36
    i32.store offset=4
    local.get 0
    local.get 35
    i32.store
    i32.const 32
    local.set 37
    local.get 6
    local.get 37
    i32.add
    local.set 38
    local.get 38
    global.set $__stack_pointer
    return
  )
  (func $_ZN4core5alloc6layout6Layout8dangling17h1a7c816fc5f64e85E (;33;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    local.get 3
    i32.load offset=12
    local.set 5
    i32.const 0
    local.set 6
    local.get 6
    local.get 5
    i32.add
    local.set 7
    local.get 7
    call $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E
    local.get 3
    local.get 7
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 8
    i32.const 16
    local.set 9
    local.get 3
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    local.get 8
    return
  )
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17h8a9b6d895c26c69cE (;34;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    local.set 5
    local.get 3
    local.set 6
    local.get 5
    local.get 6
    i32.ne
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    block ;; label = @1
      block ;; label = @2
        local.get 9
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      local.get 1
      local.get 3
      local.get 4
      call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h9ea147792981dd6eE
      unreachable
    end
    i32.const 1
    local.set 10
    local.get 2
    local.get 0
    local.get 10
    local.get 10
    local.get 1
    call $_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h9e76b637aff5fd19E
    i32.const 0
    local.set 11
    local.get 1
    local.get 11
    i32.shl
    local.set 12
    local.get 0
    local.get 2
    local.get 12
    call $memcpy
    drop
    return
  )
  (func $_ZN4core5slice3raw14from_raw_parts17hc35e6f6414fa0776E (;35;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    i32.const 1
    local.set 6
    local.get 1
    local.get 6
    local.get 6
    local.get 2
    call $_ZN4core5slice3raw14from_raw_parts18precondition_check17h89f2bfba3ce6316eE
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 5
    i32.load offset=8
    local.set 7
    local.get 5
    i32.load offset=12
    local.set 8
    local.get 5
    local.get 7
    i32.store
    local.get 5
    local.get 8
    i32.store offset=4
    local.get 5
    i32.load
    local.set 9
    local.get 5
    i32.load offset=4
    local.set 10
    local.get 0
    local.get 10
    i32.store offset=4
    local.get 0
    local.get 9
    i32.store
    i32.const 16
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return
  )
  (func $_ZN4core5slice3raw14from_raw_parts18precondition_check17h89f2bfba3ce6316eE (;36;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 0
    local.get 2
    call $_ZN4core10intrinsics23is_aligned_and_not_null17hb9c5c3ea86a987d5E
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    block ;; label = @1
      block ;; label = @2
        local.get 9
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      i32.const 0
      local.set 10
      local.get 1
      local.set 11
      local.get 10
      local.set 12
      local.get 11
      local.get 12
      i32.eq
      local.set 13
      block ;; label = @2
        block ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          i32.const -1
          local.set 14
          local.get 6
          local.get 14
          i32.store offset=12
          br 1 (;@2;)
        end
        i32.const 1
        local.set 15
        local.get 13
        local.get 15
        i32.and
        local.set 16
        block ;; label = @3
          local.get 16
          br_if 0 (;@3;)
          i32.const 2147483647
          local.set 17
          local.get 17
          local.get 1
          i32.div_u
          local.set 18
          local.get 6
          local.get 18
          i32.store offset=12
          br 1 (;@2;)
        end
        i32.const 1049504
        local.set 19
        i32.const 25
        local.set 20
        i32.const 1049608
        local.set 21
        local.get 19
        local.get 20
        local.get 21
        call $_ZN4core9panicking5panic17h0d08f040be55464aE
        unreachable
      end
      local.get 6
      i32.load offset=12
      local.set 22
      local.get 3
      local.set 23
      local.get 22
      local.set 24
      local.get 23
      local.get 24
      i32.le_u
      local.set 25
      i32.const 1
      local.set 26
      local.get 25
      local.get 26
      i32.and
      local.set 27
      block ;; label = @2
        local.get 27
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      i32.const 16
      local.set 28
      local.get 6
      local.get 28
      i32.add
      local.set 29
      local.get 29
      global.set $__stack_pointer
      return
    end
    i32.const 1049624
    local.set 30
    i32.const 162
    local.set 31
    local.get 30
    local.get 31
    call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
    unreachable
  )
  (func $_ZN4core5slice3raw18from_raw_parts_mut17he091ab023aba1f26E (;37;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    i32.const 1
    local.set 6
    local.get 1
    local.get 6
    local.get 6
    local.get 2
    call $_ZN4core5slice3raw18from_raw_parts_mut18precondition_check17h0014ad66aa927999E
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 5
    i32.load offset=8
    local.set 7
    local.get 5
    i32.load offset=12
    local.set 8
    local.get 5
    local.get 7
    i32.store
    local.get 5
    local.get 8
    i32.store offset=4
    local.get 5
    i32.load
    local.set 9
    local.get 5
    i32.load offset=4
    local.set 10
    local.get 0
    local.get 10
    i32.store offset=4
    local.get 0
    local.get 9
    i32.store
    i32.const 16
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return
  )
  (func $_ZN4core5slice3raw18from_raw_parts_mut18precondition_check17h0014ad66aa927999E (;38;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 0
    local.get 2
    call $_ZN4core10intrinsics23is_aligned_and_not_null17hb9c5c3ea86a987d5E
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    block ;; label = @1
      block ;; label = @2
        local.get 9
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      i32.const 0
      local.set 10
      local.get 1
      local.set 11
      local.get 10
      local.set 12
      local.get 11
      local.get 12
      i32.eq
      local.set 13
      block ;; label = @2
        block ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          i32.const -1
          local.set 14
          local.get 6
          local.get 14
          i32.store offset=12
          br 1 (;@2;)
        end
        i32.const 1
        local.set 15
        local.get 13
        local.get 15
        i32.and
        local.set 16
        block ;; label = @3
          local.get 16
          br_if 0 (;@3;)
          i32.const 2147483647
          local.set 17
          local.get 17
          local.get 1
          i32.div_u
          local.set 18
          local.get 6
          local.get 18
          i32.store offset=12
          br 1 (;@2;)
        end
        i32.const 1049504
        local.set 19
        i32.const 25
        local.set 20
        i32.const 1049608
        local.set 21
        local.get 19
        local.get 20
        local.get 21
        call $_ZN4core9panicking5panic17h0d08f040be55464aE
        unreachable
      end
      local.get 6
      i32.load offset=12
      local.set 22
      local.get 3
      local.set 23
      local.get 22
      local.set 24
      local.get 23
      local.get 24
      i32.le_u
      local.set 25
      i32.const 1
      local.set 26
      local.get 25
      local.get 26
      i32.and
      local.set 27
      block ;; label = @2
        local.get 27
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      i32.const 16
      local.set 28
      local.get 6
      local.get 28
      i32.add
      local.set 29
      local.get 29
      global.set $__stack_pointer
      return
    end
    i32.const 1049786
    local.set 30
    i32.const 166
    local.set 31
    local.get 30
    local.get 31
    call $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E
    unreachable
  )
  (func $_ZN5alloc3vec12Vec$LT$T$GT$13with_capacity17hc636915a59080ccfE (;39;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    i32.const 20
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.set 7
    i32.const 0
    local.set 8
    i32.const 1
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    local.get 7
    local.get 1
    local.get 10
    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$15try_allocate_in17ha15a38c208096409E
    i32.const 8
    local.set 11
    local.get 4
    local.get 11
    i32.add
    local.set 12
    i32.const 20
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 12
    local.get 14
    call $_ZN5alloc7raw_vec14handle_reserve17h0e005ef391a83454E
    local.get 4
    i32.load offset=12
    local.set 15
    local.get 4
    i32.load offset=8
    local.set 16
    local.get 0
    local.get 16
    i32.store
    local.get 0
    local.get 15
    i32.store offset=4
    i32.const 0
    local.set 17
    local.get 0
    local.get 17
    i32.store offset=8
    i32.const 32
    local.set 18
    local.get 4
    local.get 18
    i32.add
    local.set 19
    local.get 19
    global.set $__stack_pointer
    return
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$15try_allocate_in17ha15a38c208096409E (;40;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 112
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 2
    local.set 6
    local.get 5
    local.get 6
    i32.store8 offset=42
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            i32.const 8
            local.set 7
            local.get 5
            local.get 7
            i32.add
            local.set 8
            local.get 8
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$6new_in17h71a186eee79ac08eE
            local.get 5
            i32.load offset=12
            local.set 9
            local.get 5
            i32.load offset=8
            local.set 10
            local.get 0
            local.get 10
            i32.store offset=4
            local.get 0
            local.get 9
            i32.store offset=8
            i32.const 0
            local.set 11
            local.get 0
            local.get 11
            i32.store
            br 1 (;@3;)
          end
          i32.const 1
          local.set 12
          i32.const 32
          local.set 13
          local.get 5
          local.get 13
          i32.add
          local.set 14
          local.get 14
          local.get 12
          local.get 12
          local.get 1
          call $_ZN4core5alloc6layout6Layout5array5inner17hc213331b74f95680E
          local.get 5
          i32.load offset=36
          local.set 15
          local.get 5
          i32.load offset=32
          local.set 16
          local.get 5
          local.get 16
          i32.store offset=52
          local.get 5
          local.get 15
          i32.store offset=56
          local.get 5
          i32.load offset=52
          local.set 17
          i32.const 1
          local.set 18
          i32.const 0
          local.set 19
          local.get 19
          local.get 18
          local.get 17
          select
          local.set 20
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 20
                      br_if 0 (;@9;)
                      local.get 5
                      i32.load offset=52
                      local.set 21
                      local.get 5
                      i32.load offset=56
                      local.set 22
                      local.get 5
                      local.get 21
                      i32.store offset=44
                      local.get 5
                      local.get 22
                      i32.store offset=48
                      local.get 5
                      i32.load offset=48
                      local.set 23
                      i32.const 2147483647
                      local.set 24
                      local.get 23
                      local.set 25
                      local.get 24
                      local.set 26
                      local.get 25
                      local.get 26
                      i32.gt_u
                      local.set 27
                      i32.const 1
                      local.set 28
                      local.get 27
                      local.get 28
                      i32.and
                      local.set 29
                      local.get 29
                      br_if 2 (;@7;)
                      br 1 (;@8;)
                    end
                    i32.const 0
                    local.set 30
                    local.get 30
                    i32.load offset=1048984
                    local.set 31
                    i32.const 0
                    local.set 32
                    local.get 32
                    i32.load offset=1048988
                    local.set 33
                    local.get 0
                    local.get 31
                    i32.store offset=4
                    local.get 0
                    local.get 33
                    i32.store offset=8
                    i32.const 1
                    local.set 34
                    local.get 0
                    local.get 34
                    i32.store
                    br 6 (;@2;)
                  end
                  local.get 5
                  i32.load8_u offset=42
                  local.set 35
                  i32.const 1
                  local.set 36
                  local.get 35
                  local.get 36
                  i32.and
                  local.set 37
                  local.get 37
                  i32.eqz
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                i32.const 0
                local.set 38
                local.get 38
                i32.load offset=1048984
                local.set 39
                i32.const 0
                local.set 40
                local.get 40
                i32.load offset=1048988
                local.set 41
                local.get 5
                local.get 39
                i32.store offset=60
                local.get 5
                local.get 41
                i32.store offset=64
                local.get 5
                i32.load offset=60
                local.set 42
                local.get 5
                i32.load offset=64
                local.set 43
                local.get 0
                local.get 42
                i32.store offset=4
                local.get 0
                local.get 43
                i32.store offset=8
                i32.const 1
                local.set 44
                local.get 0
                local.get 44
                i32.store
                br 4 (;@2;)
              end
              local.get 5
              i32.load offset=44
              local.set 45
              local.get 5
              i32.load offset=48
              local.set 46
              i32.const 16
              local.set 47
              local.get 5
              local.get 47
              i32.add
              local.set 48
              i32.const 43
              local.set 49
              local.get 5
              local.get 49
              i32.add
              local.set 50
              local.get 48
              local.get 50
              local.get 45
              local.get 46
              call $_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h9f3767f61700a8d8E
              local.get 5
              i32.load offset=20
              local.set 51
              local.get 5
              i32.load offset=16
              local.set 52
              local.get 5
              local.get 52
              i32.store offset=68
              local.get 5
              local.get 51
              i32.store offset=72
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=44
            local.set 53
            local.get 5
            i32.load offset=48
            local.set 54
            i32.const 24
            local.set 55
            local.get 5
            local.get 55
            i32.add
            local.set 56
            i32.const 43
            local.set 57
            local.get 5
            local.get 57
            i32.add
            local.set 58
            local.get 56
            local.get 58
            local.get 53
            local.get 54
            call $_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h62a8aa582a0aca04E
            local.get 5
            i32.load offset=28
            local.set 59
            local.get 5
            i32.load offset=24
            local.set 60
            local.get 5
            local.get 60
            i32.store offset=68
            local.get 5
            local.get 59
            i32.store offset=72
          end
          local.get 5
          i32.load offset=68
          local.set 61
          i32.const 1
          local.set 62
          i32.const 0
          local.set 63
          local.get 63
          local.get 62
          local.get 61
          select
          local.set 64
          block ;; label = @4
            local.get 64
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=68
            local.set 65
            local.get 5
            local.get 65
            i32.store offset=104
            local.get 5
            i32.load offset=104
            local.set 66
            local.get 5
            local.get 66
            i32.store offset=100
            local.get 5
            local.get 1
            i32.store offset=108
            local.get 5
            i32.load offset=100
            local.set 67
            local.get 5
            local.get 67
            i32.store offset=96
            local.get 5
            i32.load offset=108
            local.set 68
            local.get 5
            local.get 68
            i32.store offset=92
            local.get 5
            i32.load offset=92
            local.set 69
            local.get 5
            i32.load offset=96
            local.set 70
            local.get 0
            local.get 69
            i32.store offset=4
            local.get 0
            local.get 70
            i32.store offset=8
            i32.const 0
            local.set 71
            local.get 0
            local.get 71
            i32.store
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=44
          local.set 72
          local.get 5
          i32.load offset=48
          local.set 73
          local.get 5
          local.get 72
          i32.store offset=84
          local.get 5
          local.get 73
          i32.store offset=88
          local.get 5
          i32.load offset=84
          local.set 74
          local.get 5
          i32.load offset=88
          local.set 75
          local.get 5
          local.get 74
          i32.store offset=76
          local.get 5
          local.get 75
          i32.store offset=80
          local.get 5
          i32.load offset=76
          local.set 76
          local.get 5
          i32.load offset=80
          local.set 77
          local.get 0
          local.get 76
          i32.store offset=4
          local.get 0
          local.get 77
          i32.store offset=8
          i32.const 1
          local.set 78
          local.get 0
          local.get 78
          i32.store
          br 1 (;@2;)
        end
        br 1 (;@1;)
      end
    end
    i32.const 112
    local.set 79
    local.get 5
    local.get 79
    i32.add
    local.set 80
    local.get 80
    global.set $__stack_pointer
    return
  )
  (func $_ZN5alloc7raw_vec14handle_reserve17h0e005ef391a83454E (;41;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 1
    i32.load
    local.set 5
    block ;; label = @1
      block ;; label = @2
        local.get 5
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.set 6
        local.get 1
        i32.load offset=8
        local.set 7
        local.get 4
        local.get 6
        i32.store offset=8
        local.get 4
        local.get 7
        i32.store offset=12
        i32.const 0
        local.set 8
        local.get 4
        local.get 8
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=4
      local.set 9
      local.get 1
      i32.load offset=8
      local.set 10
      local.get 4
      local.get 9
      i32.store offset=24
      local.get 4
      local.get 10
      i32.store offset=28
      local.get 4
      i32.load offset=24
      local.set 11
      i32.const 0
      local.set 12
      i32.const 1
      local.set 13
      local.get 13
      local.get 12
      local.get 11
      select
      local.set 14
      block ;; label = @2
        local.get 14
        br_if 0 (;@2;)
        call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
        unreachable
      end
      local.get 4
      i32.load offset=24
      local.set 15
      local.get 4
      i32.load offset=28
      local.set 16
      local.get 4
      local.get 15
      i32.store offset=16
      local.get 4
      local.get 16
      i32.store offset=20
      local.get 4
      i32.load offset=16
      local.set 17
      local.get 4
      i32.load offset=20
      local.set 18
      local.get 4
      local.get 17
      i32.store offset=8
      local.get 4
      local.get 18
      i32.store offset=12
      i32.const 1
      local.set 19
      local.get 4
      local.get 19
      i32.store offset=4
      local.get 4
      i32.load offset=4
      local.set 20
      local.get 20
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=8
      local.set 21
      local.get 4
      i32.load offset=12
      local.set 22
      local.get 21
      local.get 22
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    local.get 4
    i32.load offset=8
    local.set 23
    i32.const 12
    local.set 24
    local.get 4
    local.get 24
    i32.add
    local.set 25
    local.get 25
    i32.load
    local.set 26
    local.get 0
    local.get 23
    i32.store
    local.get 0
    local.get 26
    i32.store offset=4
    i32.const 32
    local.set 27
    local.get 4
    local.get 27
    i32.add
    local.set 28
    local.get 28
    global.set $__stack_pointer
    return
  )
  (func $_ZN5alloc3vec12Vec$LT$T$GT$14from_raw_parts17h818fbd69339cbcf0E (;42;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    i32.const 8
    local.set 7
    local.get 6
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.get 1
    local.get 3
    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$17from_raw_parts_in17hfc9d24a307422859E
    local.get 6
    i32.load offset=12
    local.set 9
    local.get 6
    i32.load offset=8
    local.set 10
    local.get 0
    local.get 10
    i32.store
    local.get 0
    local.get 9
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store offset=8
    i32.const 16
    local.set 11
    local.get 6
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$17from_raw_parts_in17hfc9d24a307422859E (;43;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 2
    i32.store offset=20
    local.get 1
    call $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E
    local.get 5
    local.get 1
    i32.store offset=28
    local.get 5
    i32.load offset=28
    local.set 6
    local.get 5
    local.get 6
    i32.store offset=24
    local.get 5
    i32.load offset=20
    local.set 7
    local.get 5
    i32.load offset=24
    local.set 8
    local.get 5
    local.get 8
    i32.store offset=16
    local.get 5
    local.get 7
    i32.store offset=12
    local.get 5
    i32.load offset=12
    local.set 9
    local.get 5
    i32.load offset=16
    local.set 10
    local.get 0
    local.get 10
    i32.store offset=4
    local.get 0
    local.get 9
    i32.store
    i32.const 32
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return
  )
  (func $_ZN5alloc3vec16Vec$LT$T$C$A$GT$10as_mut_ptr17h86bb991a14e5ac11E (;44;) (type 3) (param i32) (result i32)
    (local i32)
    local.get 0
    i32.load offset=4
    local.set 1
    local.get 1
    return
  )
  (func $_ZN5alloc5alloc5alloc17h23bcf51f2f04f9b7E (;45;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    i32.const 1057245
    local.set 5
    i32.const 1
    local.set 6
    local.get 5
    local.get 6
    call $_ZN4core3ptr13read_volatile18precondition_check17h43cd3ea6748ae625E
    i32.const 0
    local.set 7
    local.get 7
    i32.load8_u offset=1057245
    local.set 8
    local.get 4
    local.get 8
    i32.store8 offset=15
    local.get 4
    i32.load offset=4
    local.set 9
    local.get 4
    i32.load
    local.set 10
    local.get 4
    local.get 10
    i32.store offset=8
    local.get 4
    i32.load offset=8
    local.set 11
    local.get 9
    local.get 11
    call $__rust_alloc
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return
  )
  (func $_ZN5alloc5alloc6Global10alloc_impl17h363344fcda59bf05E (;46;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 5
    i32.const 96
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 7
    local.get 2
    i32.store
    local.get 7
    local.get 3
    i32.store offset=4
    local.get 7
    i32.load offset=4
    local.set 8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 8
                br_if 0 (;@6;)
                local.get 7
                local.set 9
                local.get 9
                call $_ZN4core5alloc6layout6Layout8dangling17h1a7c816fc5f64e85E
                local.set 10
                local.get 7
                local.get 10
                i32.store offset=64
                i32.const 0
                local.set 11
                local.get 7
                local.get 11
                i32.store offset=68
                local.get 7
                i32.load offset=64
                local.set 12
                local.get 7
                i32.load offset=68
                local.set 13
                local.get 7
                local.get 12
                i32.store offset=56
                local.get 7
                local.get 13
                i32.store offset=60
                local.get 7
                i32.load offset=56
                local.set 14
                local.get 7
                i32.load offset=60
                local.set 15
                br 1 (;@5;)
              end
              local.get 4
              local.set 16
              local.get 16
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            local.get 14
            call $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E
            local.get 7
            local.get 14
            i32.store offset=16
            local.get 7
            local.get 15
            i32.store offset=20
            local.get 7
            i32.load offset=16
            local.set 17
            local.get 7
            i32.load offset=20
            local.set 18
            local.get 7
            local.get 17
            i32.store offset=8
            local.get 7
            local.get 18
            i32.store offset=12
            br 3 (;@1;)
          end
          local.get 7
          i32.load
          local.set 19
          local.get 7
          i32.load offset=4
          local.set 20
          local.get 19
          local.get 20
          call $_ZN5alloc5alloc5alloc17h23bcf51f2f04f9b7E
          local.set 21
          local.get 7
          local.get 21
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 7
        i32.load
        local.set 22
        local.get 7
        i32.load offset=4
        local.set 23
        local.get 7
        local.get 22
        i32.store offset=28
        local.get 7
        local.get 23
        i32.store offset=32
        local.get 7
        i32.load offset=32
        local.set 24
        local.get 7
        i32.load offset=28
        local.set 25
        local.get 7
        local.get 25
        i32.store offset=72
        local.get 7
        i32.load offset=72
        local.set 26
        local.get 24
        local.get 26
        call $__rust_alloc_zeroed
        local.set 27
        local.get 7
        local.get 27
        i32.store offset=24
      end
      local.get 7
      i32.load offset=24
      local.set 28
      block ;; label = @2
        local.get 28
        br_if 0 (;@2;)
        i32.const 0
        local.set 29
        local.get 7
        local.get 29
        i32.store offset=44
        i32.const 0
        local.set 30
        local.get 7
        local.get 30
        i32.store offset=40
        i32.const 0
        local.set 31
        local.get 31
        i32.load offset=1048984
        local.set 32
        i32.const 0
        local.set 33
        local.get 33
        i32.load offset=1048988
        local.set 34
        local.get 7
        local.get 32
        i32.store offset=8
        local.get 7
        local.get 34
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 28
      call $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E
      local.get 7
      local.get 28
      i32.store offset=76
      local.get 7
      i32.load offset=76
      local.set 35
      local.get 7
      local.get 35
      i32.store offset=44
      local.get 7
      i32.load offset=44
      local.set 36
      local.get 7
      local.get 36
      i32.store offset=40
      local.get 7
      i32.load offset=40
      local.set 37
      local.get 7
      local.get 37
      i32.store offset=36
      local.get 7
      i32.load offset=36
      local.set 38
      local.get 7
      local.get 38
      i32.store offset=88
      local.get 7
      local.get 8
      i32.store offset=92
      local.get 7
      i32.load offset=88
      local.set 39
      local.get 7
      i32.load offset=92
      local.set 40
      local.get 7
      local.get 39
      i32.store offset=80
      local.get 7
      local.get 40
      i32.store offset=84
      local.get 7
      i32.load offset=80
      local.set 41
      local.get 7
      i32.load offset=84
      local.set 42
      local.get 41
      call $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E
      local.get 7
      local.get 41
      i32.store offset=48
      local.get 7
      local.get 42
      i32.store offset=52
      local.get 7
      i32.load offset=48
      local.set 43
      local.get 7
      i32.load offset=52
      local.set 44
      local.get 7
      local.get 43
      i32.store offset=8
      local.get 7
      local.get 44
      i32.store offset=12
    end
    local.get 7
    i32.load offset=8
    local.set 45
    local.get 7
    i32.load offset=12
    local.set 46
    local.get 0
    local.get 46
    i32.store offset=4
    local.get 0
    local.get 45
    i32.store
    i32.const 96
    local.set 47
    local.get 7
    local.get 47
    i32.add
    local.set 48
    local.get 48
    global.set $__stack_pointer
    return
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h068377b33ed2974bE (;47;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 1
    i32.load
    local.set 5
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.set 6
        i32.const 0
        local.set 7
        local.get 6
        local.get 7
        i32.shl
        local.set 8
        local.get 4
        local.get 8
        i32.store offset=12
        i32.const 1
        local.set 9
        local.get 4
        local.get 9
        i32.store offset=8
        local.get 1
        i32.load offset=4
        local.set 10
        local.get 4
        local.get 10
        i32.store offset=28
        local.get 4
        i32.load offset=28
        local.set 11
        local.get 4
        local.get 11
        i32.store offset=16
        local.get 4
        i32.load offset=8
        local.set 12
        local.get 4
        i32.load offset=12
        local.set 13
        local.get 4
        local.get 12
        i32.store offset=20
        local.get 4
        local.get 13
        i32.store offset=24
        local.get 4
        i64.load offset=16 align=4
        local.set 14
        local.get 0
        local.get 14
        i64.store align=4
        i32.const 8
        local.set 15
        local.get 0
        local.get 15
        i32.add
        local.set 16
        i32.const 16
        local.set 17
        local.get 4
        local.get 17
        i32.add
        local.set 18
        local.get 18
        local.get 15
        i32.add
        local.set 19
        local.get 19
        i32.load
        local.set 20
        local.get 16
        local.get 20
        i32.store
        br 1 (;@1;)
      end
      i32.const 0
      local.set 21
      local.get 0
      local.get 21
      i32.store offset=4
    end
    return
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$6new_in17h71a186eee79ac08eE (;48;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    i32.const 1
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    call $_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17h3d16348e869effa5E
    i32.const 1
    local.set 7
    local.get 3
    local.get 7
    i32.store offset=12
    local.get 3
    i32.load offset=12
    local.set 8
    local.get 3
    local.get 8
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 9
    local.get 3
    local.get 9
    i32.store offset=4
    i32.const 0
    local.set 10
    local.get 3
    local.get 10
    i32.store
    local.get 3
    i32.load
    local.set 11
    local.get 3
    i32.load offset=4
    local.set 12
    local.get 0
    local.get 12
    i32.store offset=4
    local.get 0
    local.get 11
    i32.store
    i32.const 16
    local.set 13
    local.get 3
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    return
  )
  (func $_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h9f3767f61700a8d8E (;49;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    i32.const 0
    local.set 7
    i32.const 8
    local.set 8
    local.get 6
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.get 1
    local.get 2
    local.get 3
    local.get 7
    call $_ZN5alloc5alloc6Global10alloc_impl17h363344fcda59bf05E
    local.get 6
    i32.load offset=8
    local.set 10
    local.get 6
    i32.load offset=12
    local.set 11
    local.get 0
    local.get 11
    i32.store offset=4
    local.get 0
    local.get 10
    i32.store
    i32.const 16
    local.set 12
    local.get 6
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    return
  )
  (func $_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h62a8aa582a0aca04E (;50;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    i32.const 1
    local.set 7
    i32.const 8
    local.set 8
    local.get 6
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.get 1
    local.get 2
    local.get 3
    local.get 7
    call $_ZN5alloc5alloc6Global10alloc_impl17h363344fcda59bf05E
    local.get 6
    i32.load offset=8
    local.set 10
    local.get 6
    i32.load offset=12
    local.set 11
    local.get 0
    local.get 11
    i32.store offset=4
    local.get 0
    local.get 10
    i32.store
    i32.const 16
    local.set 12
    local.get 6
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    return
  )
  (func $_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h9c609ba52ed65d01E (;51;) (type 6) (param i32 i32 i32)
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    return
  )
  (func $_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h288f57b37634a2f9E (;52;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 32
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 2
    i32.store offset=12
    local.get 6
    local.get 3
    i32.store offset=16
    local.get 6
    i32.load offset=16
    local.set 7
    block ;; label = @1
      block ;; label = @2
        local.get 7
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      local.get 6
      i32.load offset=12
      local.set 8
      local.get 6
      i32.load offset=16
      local.set 9
      local.get 6
      local.get 8
      i32.store offset=20
      local.get 6
      local.get 9
      i32.store offset=24
      local.get 6
      i32.load offset=24
      local.set 10
      local.get 6
      i32.load offset=20
      local.set 11
      local.get 6
      local.get 11
      i32.store offset=28
      local.get 6
      i32.load offset=28
      local.set 12
      local.get 1
      local.get 10
      local.get 12
      call $__rust_dealloc
    end
    i32.const 32
    local.set 13
    local.get 6
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    return
  )
  (func $alloc (;53;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 32
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    i32.const 4
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 6
    local.get 0
    call $_ZN5alloc3vec12Vec$LT$T$GT$13with_capacity17hc636915a59080ccfE
    i32.const 4
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    local.get 9
    call $_ZN5alloc3vec16Vec$LT$T$C$A$GT$10as_mut_ptr17h86bb991a14e5ac11E
    local.set 10
    i32.const 8
    local.set 11
    i32.const 16
    local.set 12
    local.get 3
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.get 11
    i32.add
    local.set 14
    i32.const 4
    local.set 15
    local.get 3
    local.get 15
    i32.add
    local.set 16
    local.get 16
    local.get 11
    i32.add
    local.set 17
    local.get 17
    i32.load
    local.set 18
    local.get 14
    local.get 18
    i32.store
    local.get 3
    i64.load offset=4 align=4
    local.set 19
    local.get 3
    local.get 19
    i64.store offset=16
    i32.const 16
    local.set 20
    local.get 3
    local.get 20
    i32.add
    local.set 21
    local.get 21
    local.set 22
    local.get 22
    call $_ZN4core3mem6forget17h14b5f0733dcc2c85E
    i32.const 32
    local.set 23
    local.get 3
    local.get 23
    i32.add
    local.set 24
    local.get 24
    global.set $__stack_pointer
    local.get 10
    return
  )
  (func $dealloc (;54;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    i32.const 4
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.set 7
    i32.const 0
    local.set 8
    local.get 7
    local.get 0
    local.get 8
    local.get 1
    call $_ZN5alloc3vec12Vec$LT$T$GT$14from_raw_parts17h818fbd69339cbcf0E
    i32.const 4
    local.set 9
    local.get 4
    local.get 9
    i32.add
    local.set 10
    local.get 10
    local.set 11
    local.get 11
    call $_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h64d70a5a367011bbE
    i32.const 16
    local.set 12
    local.get 4
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    return
  )
  (func $copy (;55;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 1
    call $alloc
    local.set 5
    local.get 4
    local.get 0
    local.get 1
    call $_ZN4core5slice3raw14from_raw_parts17hc35e6f6414fa0776E
    local.get 4
    i32.load offset=4
    local.set 6
    local.get 4
    i32.load
    local.set 7
    i32.const 8
    local.set 8
    local.get 4
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.get 5
    local.get 1
    call $_ZN4core5slice3raw18from_raw_parts_mut17he091ab023aba1f26E
    local.get 4
    i32.load offset=12
    local.set 10
    local.get 4
    i32.load offset=8
    local.set 11
    i32.const 1049976
    local.set 12
    local.get 11
    local.get 10
    local.get 7
    local.get 6
    local.get 12
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17h8a9b6d895c26c69cE
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 5
    return
  )
  (func $create_closure (;56;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 64
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    i32.const 8
    local.set 5
    local.get 5
    call $alloc
    local.set 6
    i32.const 8
    local.set 7
    i32.const 8
    local.set 8
    local.get 4
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.get 6
    local.get 7
    call $_ZN4core5slice3raw18from_raw_parts_mut17he091ab023aba1f26E
    local.get 4
    i32.load offset=12
    local.set 10
    local.get 4
    i32.load offset=8
    local.set 11
    i32.const 0
    local.set 12
    local.get 4
    local.get 12
    i32.store offset=32
    i32.const 4
    local.set 13
    local.get 4
    local.get 13
    i32.store offset=36
    local.get 4
    i32.load offset=32
    local.set 14
    local.get 4
    i32.load offset=36
    local.set 15
    i32.const 1049992
    local.set 16
    i32.const 16
    local.set 17
    local.get 4
    local.get 17
    i32.add
    local.set 18
    local.get 18
    local.get 14
    local.get 15
    local.get 11
    local.get 10
    local.get 16
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hed0d2e3423b175c1E
    local.get 4
    i32.load offset=20
    local.set 19
    local.get 4
    i32.load offset=16
    local.set 20
    local.get 0
    call $_ZN4core3num21_$LT$impl$u20$u32$GT$11to_le_bytes17hd3abb6bae2878ab8E
    local.set 21
    local.get 4
    local.get 21
    i32.store offset=56
    local.get 4
    i32.load offset=56
    local.set 22
    local.get 4
    local.get 22
    i32.store offset=40
    i32.const 40
    local.set 23
    local.get 4
    local.get 23
    i32.add
    local.set 24
    local.get 24
    local.set 25
    i32.const 4
    local.set 26
    i32.const 1050008
    local.set 27
    local.get 20
    local.get 19
    local.get 25
    local.get 26
    local.get 27
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17h8a9b6d895c26c69cE
    i32.const 4
    local.set 28
    local.get 4
    local.get 28
    i32.store offset=44
    i32.const 8
    local.set 29
    local.get 4
    local.get 29
    i32.store offset=48
    local.get 4
    i32.load offset=44
    local.set 30
    local.get 4
    i32.load offset=48
    local.set 31
    i32.const 1050024
    local.set 32
    i32.const 24
    local.set 33
    local.get 4
    local.get 33
    i32.add
    local.set 34
    local.get 34
    local.get 30
    local.get 31
    local.get 11
    local.get 10
    local.get 32
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hed0d2e3423b175c1E
    local.get 4
    i32.load offset=28
    local.set 35
    local.get 4
    i32.load offset=24
    local.set 36
    local.get 1
    call $_ZN4core3num21_$LT$impl$u20$u32$GT$11to_le_bytes17hd3abb6bae2878ab8E
    local.set 37
    local.get 4
    local.get 37
    i32.store offset=60
    local.get 4
    i32.load offset=60
    local.set 38
    local.get 4
    local.get 38
    i32.store offset=52
    i32.const 52
    local.set 39
    local.get 4
    local.get 39
    i32.add
    local.set 40
    local.get 40
    local.set 41
    i32.const 4
    local.set 42
    i32.const 1050040
    local.set 43
    local.get 36
    local.get 35
    local.get 41
    local.get 42
    local.get 43
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17h8a9b6d895c26c69cE
    i32.const 64
    local.set 44
    local.get 4
    local.get 44
    i32.add
    local.set 45
    local.get 45
    global.set $__stack_pointer
    local.get 6
    return
  )
  (func $test_write (;57;) (type 10) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 96
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    i32.const 10
    local.set 3
    local.get 3
    call $alloc
    local.set 4
    i32.const 10
    local.set 5
    i32.const 16
    local.set 6
    local.get 2
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.get 4
    local.get 5
    call $_ZN4core5slice3raw18from_raw_parts_mut17he091ab023aba1f26E
    local.get 2
    i32.load offset=20
    local.set 8
    local.get 2
    i32.load offset=16
    local.set 9
    i32.const 0
    local.set 10
    local.get 2
    local.get 10
    i32.store offset=32
    i32.const 10
    local.set 11
    local.get 2
    local.get 11
    i32.store offset=36
    local.get 2
    i32.load offset=32
    local.set 12
    local.get 2
    i32.load offset=36
    local.set 13
    i32.const 24
    local.set 14
    local.get 2
    local.get 14
    i32.add
    local.set 15
    local.get 15
    local.get 12
    local.get 13
    call $_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h9c609ba52ed65d01E
    local.get 2
    i32.load offset=28
    local.set 16
    local.get 2
    i32.load offset=24
    local.set 17
    local.get 2
    local.get 17
    i32.store offset=40
    local.get 2
    local.get 16
    i32.store offset=44
    loop ;; label = @1
      i32.const 8
      local.set 18
      local.get 2
      local.get 18
      i32.add
      local.set 19
      i32.const 40
      local.set 20
      local.get 2
      local.get 20
      i32.add
      local.set 21
      local.get 19
      local.get 21
      call $_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hee404bf6a04169ccE
      local.get 2
      i32.load offset=12
      local.set 22
      local.get 2
      i32.load offset=8
      local.set 23
      local.get 2
      local.get 23
      i32.store offset=48
      local.get 2
      local.get 22
      i32.store offset=52
      local.get 2
      i32.load offset=48
      local.set 24
      block ;; label = @2
        local.get 24
        br_if 0 (;@2;)
        i32.const 96
        local.set 25
        local.get 2
        local.get 25
        i32.add
        local.set 26
        local.get 26
        global.set $__stack_pointer
        local.get 4
        return
      end
      local.get 2
      i32.load offset=52
      local.set 27
      local.get 27
      local.set 28
      local.get 8
      local.set 29
      local.get 28
      local.get 29
      i32.lt_u
      local.set 30
      i32.const 1
      local.set 31
      local.get 30
      local.get 31
      i32.and
      local.set 32
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 32
            i32.eqz
            br_if 0 (;@4;)
            local.get 9
            local.get 27
            i32.add
            local.set 33
            local.get 33
            local.get 27
            i32.store8
            local.get 27
            local.set 34
            local.get 8
            local.set 35
            local.get 34
            local.get 35
            i32.lt_u
            local.set 36
            i32.const 1
            local.set 37
            local.get 36
            local.get 37
            i32.and
            local.set 38
            local.get 38
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          i32.const 1050056
          local.set 39
          local.get 27
          local.get 8
          local.get 39
          call $_ZN4core9panicking18panic_bounds_check17hedaf9adac3cd8dfbE
          unreachable
        end
        local.get 9
        local.get 27
        i32.add
        local.set 40
        local.get 2
        local.get 40
        i32.store offset=88
        i32.const 1
        local.set 41
        local.get 2
        local.get 41
        i32.store offset=92
        local.get 2
        i32.load offset=88
        local.set 42
        local.get 2
        i32.load offset=92
        local.set 43
        local.get 2
        local.get 42
        i32.store offset=80
        local.get 2
        local.get 43
        i32.store offset=84
        i32.const 56
        local.set 44
        local.get 2
        local.get 44
        i32.add
        local.set 45
        local.get 45
        local.set 46
        i32.const 1050076
        local.set 47
        i32.const 2
        local.set 48
        i32.const 80
        local.set 49
        local.get 2
        local.get 49
        i32.add
        local.set 50
        local.get 50
        local.set 51
        i32.const 1
        local.set 52
        local.get 46
        local.get 47
        local.get 48
        local.get 51
        local.get 52
        call $_ZN4core3fmt9Arguments6new_v117hf4821840569104c7E
        i32.const 56
        local.set 53
        local.get 2
        local.get 53
        i32.add
        local.set 54
        local.get 54
        local.set 55
        local.get 55
        call $_ZN3std2io5stdio6_print17h22fc2cf0228ddb4cE
        br 1 (;@1;)
      end
    end
    i32.const 1050092
    local.set 56
    local.get 27
    local.get 8
    local.get 56
    call $_ZN4core9panicking18panic_bounds_check17hedaf9adac3cd8dfbE
    unreachable
  )
  (func $test_read (;58;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 96
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=28
    i32.const 10
    local.set 5
    local.get 3
    local.get 5
    i32.store offset=32
    local.get 3
    i32.load offset=28
    local.set 6
    local.get 3
    i32.load offset=32
    local.set 7
    i32.const 16
    local.set 8
    local.get 3
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.get 6
    local.get 7
    call $_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h9c609ba52ed65d01E
    local.get 3
    i32.load offset=20
    local.set 10
    local.get 3
    i32.load offset=16
    local.set 11
    local.get 3
    local.get 11
    i32.store offset=36
    local.get 3
    local.get 10
    i32.store offset=40
    loop ;; label = @1
      i32.const 8
      local.set 12
      local.get 3
      local.get 12
      i32.add
      local.set 13
      i32.const 36
      local.set 14
      local.get 3
      local.get 14
      i32.add
      local.set 15
      local.get 13
      local.get 15
      call $_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hee404bf6a04169ccE
      local.get 3
      i32.load offset=12
      local.set 16
      local.get 3
      i32.load offset=8
      local.set 17
      local.get 3
      local.get 17
      i32.store offset=44
      local.get 3
      local.get 16
      i32.store offset=48
      local.get 3
      i32.load offset=44
      local.set 18
      block ;; label = @2
        local.get 18
        br_if 0 (;@2;)
        i32.const 10
        local.set 19
        local.get 0
        local.get 19
        call $dealloc
        i32.const 96
        local.set 20
        local.get 3
        local.get 20
        i32.add
        local.set 21
        local.get 21
        global.set $__stack_pointer
        return
      end
      local.get 3
      i32.load offset=48
      local.set 22
      local.get 0
      local.get 22
      i32.add
      local.set 23
      local.get 23
      i32.load8_u
      local.set 24
      local.get 3
      local.get 24
      i32.store8 offset=87
      i32.const 87
      local.set 25
      local.get 3
      local.get 25
      i32.add
      local.set 26
      local.get 3
      local.get 26
      i32.store offset=88
      i32.const 1
      local.set 27
      local.get 3
      local.get 27
      i32.store offset=92
      local.get 3
      i32.load offset=88
      local.set 28
      local.get 3
      i32.load offset=92
      local.set 29
      local.get 3
      local.get 28
      i32.store offset=76
      local.get 3
      local.get 29
      i32.store offset=80
      i32.const 52
      local.set 30
      local.get 3
      local.get 30
      i32.add
      local.set 31
      local.get 31
      local.set 32
      i32.const 1050076
      local.set 33
      i32.const 2
      local.set 34
      i32.const 76
      local.set 35
      local.get 3
      local.get 35
      i32.add
      local.set 36
      local.get 36
      local.set 37
      i32.const 1
      local.set 38
      local.get 32
      local.get 33
      local.get 34
      local.get 37
      local.get 38
      call $_ZN4core3fmt9Arguments6new_v117hf4821840569104c7E
      i32.const 52
      local.set 39
      local.get 3
      local.get 39
      i32.add
      local.set 40
      local.get 40
      local.set 41
      local.get 41
      call $_ZN3std2io5stdio6_print17h22fc2cf0228ddb4cE
      br 0 (;@1;)
    end
  )
  (func $main (;59;) (type 0)
    (local i32)
    call $test_write
    local.set 0
    local.get 0
    call $test_read
    return
  )
  (func $__main_void (;60;) (type 10) (result i32)
    (local i32 i32 i32 i32)
    i32.const 2
    local.set 0
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    local.get 0
    local.get 1
    local.get 1
    local.get 2
    call $_ZN3std2rt10lang_start17h3d0237fd07e110ebE
    local.set 3
    local.get 3
    return
  )
  (func $__rust_alloc (;61;) (type 4) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return
  )
  (func $__rust_dealloc (;62;) (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return
  )
  (func $__rust_realloc (;63;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return
  )
  (func $__rust_alloc_zeroed (;64;) (type 4) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc_zeroed
    local.set 2
    local.get 2
    return
  )
  (func $__rust_alloc_error_handler (;65;) (type 2) (param i32 i32)
    local.get 0
    local.get 1
    call $__rg_oom
    return
  )
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h103b3b85354afb20E (;66;) (type 2) (param i32 i32)
    local.get 0
    i64.const -4493808902380553279
    i64.store offset=8
    local.get 0
    i64.const -163230743173927068
    i64.store
  )
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdd99a549e346a7e9E (;67;) (type 2) (param i32 i32)
    local.get 0
    i64.const 2691881560090170292
    i64.store offset=8
    local.get 0
    i64.const 8189784611853400225
    i64.store
  )
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf075f550b029b4fE (;68;) (type 2) (param i32 i32)
    local.get 0
    i64.const 5401495139214674892
    i64.store offset=8
    local.get 0
    i64.const 8005529906406067824
    i64.store
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2b3819cd6e06b9c4E (;69;) (type 4) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.set 0
    block ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h694040502f01b637E
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17h54211fc08dfefdf6E
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17hdc93e5d12c9eacc2E
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h765799883bb3e57aE (;70;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.load
    i32.load
    local.tee 0
    i32.store offset=12
    local.get 1
    i32.const 1050400
    i32.const 8
    local.get 0
    i32.const 12
    i32.add
    i32.const 1050408
    local.get 2
    i32.const 12
    i32.add
    i32.const 1050424
    call $_ZN4core3fmt9Formatter25debug_tuple_field2_finish17heaf853358da232e5E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h8e49938832ba616eE (;71;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 0
        i32.load8_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 1050488
        i32.const 4
        call $_ZN4core3fmt9Formatter9write_str17hf69c1071e35879f4E
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      local.get 0
      i32.const 1
      i32.add
      i32.store offset=12
      local.get 1
      i32.const 1050492
      i32.const 4
      local.get 2
      i32.const 12
      i32.add
      i32.const 1050112
      call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17ha586373309166b49E
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha0a2ff7e524e7ae6E (;72;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17h8449c20555d5b516E
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hac9e9a6579d887b2E (;73;) (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.const 1050108
    i32.const 2
    call $_ZN4core3fmt9Formatter3pad17h9c96c844f75776beE
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hd29c5c030bcac8cfE (;74;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 0
    i32.load offset=8
    local.set 3
    local.get 0
    i32.load offset=4
    local.set 0
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call $_ZN4core3fmt9Formatter10debug_list17h0388f2b8b8bc3ac8E
    block ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 2
        local.get 0
        i32.store offset=12
        local.get 2
        i32.const 4
        i32.add
        local.get 2
        i32.const 12
        i32.add
        i32.const 1050112
        call $_ZN4core3fmt8builders8DebugSet5entry17h51397cc4d550b533E
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 4
    i32.add
    call $_ZN4core3fmt8builders9DebugList6finish17h5a95446ce01a0998E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5e016345119d42cdE (;75;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN70_$LT$core..panic..location..Location$u20$as$u20$core..fmt..Display$GT$3fmt17haee63deca0b34086E
  )
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6eea59c5fd9dd22cE (;76;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0eca663ca1c2f482E
  )
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h2070fb1ae8c0636dE (;77;) (type 4) (param i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h3921da4b80c91f1dE
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h086f04df513217ceE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17hdbf1a04c09c4883bE
  )
  (func $_ZN4core3fmt5Write10write_char17h6ec79911d954a2e3E (;78;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.load
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      local.get 3
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h13a111fb89e6aaffE
      local.get 1
      i32.load offset=8
      local.set 0
    end
    local.get 1
    i32.load offset=4
    local.get 0
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 3
    call $memcpy
    drop
    local.get 1
    local.get 0
    local.get 3
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h13a111fb89e6aaffE (;79;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block ;; label = @2
        block ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h07e6352acbc223f7E
      block ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
    unreachable
  )
  (func $_ZN4core3fmt5Write10write_char17h71a5231a37b379deE (;80;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha8e6296570c371c7E
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha8e6296570c371c7E (;81;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          loop ;; label = @4
            local.get 3
            local.get 2
            i32.store offset=4
            local.get 3
            local.get 1
            i32.store
            local.get 3
            i32.const 8
            i32.add
            i32.const 2
            local.get 3
            i32.const 1
            call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
            block ;; label = @5
              local.get 3
              i32.load16_u offset=8
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 5
                br_if 0 (;@6;)
                i32.const 2
                local.set 2
                i32.const 1052016
                local.set 5
                br 3 (;@3;)
              end
              local.get 2
              local.get 5
              i32.lt_u
              br_if 4 (;@1;)
              local.get 1
              local.get 5
              i32.add
              local.set 1
              local.get 2
              local.get 5
              i32.sub
              local.tee 2
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            block ;; label = @5
              local.get 3
              i32.load16_u offset=10
              local.tee 5
              i32.const 27
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
          end
          i32.const 0
          local.set 2
        end
        local.get 0
        i32.load offset=4
        local.set 4
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 4
          i32.load
          local.tee 6
          local.get 4
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 5
        i32.store offset=4
        local.get 0
        local.get 2
        i32.store
        i32.const 1
        local.set 4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      return
    end
    local.get 5
    local.get 2
    i32.const 1052028
    call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
    unreachable
  )
  (func $_ZN4core3fmt5Write10write_char17hdb273777cacb033eE (;82;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=4
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=6
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=4
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=5
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=4
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=4
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=7
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=6
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=5
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=4
      i32.const 4
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17hd88402d4acde7ae8E
    block ;; label = @1
      local.get 2
      i32.load8_u offset=8
      local.tee 1
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 3
      local.get 2
      i64.load offset=8
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 5
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 5
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load
        local.tee 6
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.tee 5
        i32.load
        call_indirect (type 1)
        block ;; label = @3
          local.get 5
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 5
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 3
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store align=4
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.ne
  )
  (func $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17hd88402d4acde7ae8E (;83;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 1
                      i32.load
                      local.tee 5
                      i32.load offset=12
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const -1
                      i32.store offset=12
                      local.get 4
                      i32.const 8
                      i32.add
                      i32.const 10
                      local.get 2
                      local.get 3
                      call $_ZN4core5slice6memchr7memrchr17h5e445b4a086eabe1E
                      block ;; label = @10
                        local.get 4
                        i32.load offset=8
                        br_if 0 (;@10;)
                        block ;; label = @11
                          local.get 5
                          i32.const 24
                          i32.add
                          i32.load
                          local.tee 6
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 6
                          br 8 (;@3;)
                        end
                        local.get 6
                        local.get 5
                        i32.const 20
                        i32.add
                        i32.load
                        local.tee 7
                        i32.add
                        i32.const -1
                        i32.add
                        i32.load8_u
                        i32.const 10
                        i32.ne
                        br_if 7 (;@3;)
                        i32.const 0
                        local.set 1
                        loop ;; label = @11
                          local.get 4
                          local.get 6
                          local.get 1
                          i32.sub
                          local.tee 8
                          i32.store offset=44
                          local.get 4
                          local.get 7
                          local.get 1
                          i32.add
                          local.tee 9
                          i32.store offset=40
                          local.get 4
                          i32.const 16
                          i32.add
                          i32.const 1
                          local.get 4
                          i32.const 40
                          i32.add
                          i32.const 1
                          call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 4
                                    i32.load16_u offset=16
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 8
                                    local.set 10
                                    local.get 4
                                    i32.load16_u offset=18
                                    local.tee 11
                                    i32.const 8
                                    i32.eq
                                    br_if 1 (;@15;)
                                    local.get 5
                                    i32.const 0
                                    i32.store8 offset=28
                                    local.get 11
                                    i32.const 27
                                    i32.eq
                                    br_if 4 (;@12;)
                                    i32.const 0
                                    local.set 6
                                    br 2 (;@14;)
                                  end
                                  local.get 4
                                  i32.load offset=20
                                  local.set 10
                                end
                                local.get 5
                                i32.const 0
                                i32.store8 offset=28
                                local.get 10
                                br_if 1 (;@13;)
                                i32.const 2
                                local.set 6
                                i32.const 1050952
                                local.set 11
                              end
                              block ;; label = @14
                                local.get 1
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 7
                                local.get 9
                                local.get 8
                                call $memmove
                                drop
                                local.get 5
                                i32.const 24
                                i32.add
                                local.get 8
                                i32.store
                              end
                              local.get 0
                              local.get 11
                              i32.store offset=4
                              local.get 0
                              local.get 6
                              i32.store
                              br 11 (;@2;)
                            end
                            local.get 10
                            local.get 1
                            i32.add
                            local.set 1
                          end
                          local.get 1
                          local.get 6
                          i32.ge_u
                          br_if 7 (;@4;)
                          br 0 (;@11;)
                        end
                      end
                      local.get 3
                      local.get 4
                      i32.load offset=12
                      i32.const 1
                      i32.add
                      local.tee 12
                      i32.lt_u
                      br_if 4 (;@5;)
                      local.get 5
                      i32.const 24
                      i32.add
                      i32.load
                      local.tee 1
                      br_if 1 (;@8;)
                      local.get 12
                      i32.eqz
                      br_if 2 (;@7;)
                      local.get 2
                      local.set 6
                      local.get 12
                      local.set 1
                      loop ;; label = @10
                        local.get 4
                        local.get 1
                        i32.store offset=44
                        local.get 4
                        local.get 6
                        i32.store offset=40
                        local.get 4
                        i32.const 16
                        i32.add
                        i32.const 1
                        local.get 4
                        i32.const 40
                        i32.add
                        i32.const 1
                        call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 4
                              i32.load16_u offset=16
                              br_if 0 (;@13;)
                              block ;; label = @14
                                local.get 4
                                i32.load offset=20
                                local.tee 10
                                br_if 0 (;@14;)
                                i32.const 1052016
                                local.set 10
                                i64.const 2
                                local.set 13
                                br 8 (;@6;)
                              end
                              local.get 1
                              local.get 10
                              i32.lt_u
                              br_if 1 (;@12;)
                              local.get 6
                              local.get 10
                              i32.add
                              local.set 6
                              local.get 1
                              local.get 10
                              i32.sub
                              local.set 1
                              br 2 (;@11;)
                            end
                            local.get 4
                            i32.load16_u offset=18
                            local.tee 10
                            i32.const 27
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 10
                            i32.const 8
                            i32.eq
                            br_if 5 (;@7;)
                            i64.const 0
                            local.set 13
                            br 6 (;@6;)
                          end
                          local.get 10
                          local.get 1
                          i32.const 1052028
                          call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
                          unreachable
                        end
                        local.get 1
                        br_if 0 (;@10;)
                        br 3 (;@7;)
                      end
                    end
                    i32.const 1051884
                    call $_ZN4core4cell22panic_already_borrowed17h17ad173f4dec947aE
                    unreachable
                  end
                  block ;; label = @8
                    block ;; label = @9
                      local.get 5
                      i32.load offset=16
                      local.get 1
                      i32.sub
                      local.get 12
                      i32.le_u
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 20
                      i32.add
                      i32.load
                      local.get 1
                      i32.add
                      local.get 2
                      local.get 12
                      call $memcpy
                      drop
                      local.get 5
                      i32.const 24
                      i32.add
                      local.get 1
                      local.get 12
                      i32.add
                      local.tee 10
                      i32.store
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.const 16
                    i32.add
                    local.get 5
                    i32.const 16
                    i32.add
                    local.get 2
                    local.get 12
                    call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc9adfdbd0f80279cE
                    block ;; label = @9
                      local.get 4
                      i32.load8_u offset=16
                      i32.const 4
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 4
                      i64.load offset=16
                      i64.store align=4
                      br 7 (;@2;)
                    end
                    local.get 5
                    i32.const 24
                    i32.add
                    i32.load
                    local.set 10
                  end
                  local.get 10
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 20
                  i32.add
                  i32.load
                  local.set 7
                  i32.const 0
                  local.set 1
                  loop ;; label = @8
                    local.get 4
                    local.get 10
                    local.get 1
                    i32.sub
                    local.tee 8
                    i32.store offset=44
                    local.get 4
                    local.get 7
                    local.get 1
                    i32.add
                    local.tee 9
                    i32.store offset=40
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.const 1
                    local.get 4
                    i32.const 40
                    i32.add
                    i32.const 1
                    call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 4
                              i32.load16_u offset=16
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 8
                              local.set 6
                              local.get 4
                              i32.load16_u offset=18
                              local.tee 11
                              i32.const 8
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 5
                              i32.const 0
                              i32.store8 offset=28
                              local.get 11
                              i32.const 27
                              i32.eq
                              br_if 4 (;@9;)
                              i32.const 0
                              local.set 6
                              br 2 (;@11;)
                            end
                            local.get 4
                            i32.load offset=20
                            local.set 6
                          end
                          local.get 5
                          i32.const 0
                          i32.store8 offset=28
                          local.get 6
                          br_if 1 (;@10;)
                          i32.const 2
                          local.set 6
                          i32.const 1050952
                          local.set 11
                        end
                        block ;; label = @11
                          local.get 1
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 7
                          local.get 9
                          local.get 8
                          call $memmove
                          drop
                          local.get 5
                          i32.const 24
                          i32.add
                          local.get 8
                          i32.store
                        end
                        local.get 0
                        local.get 11
                        i32.store offset=4
                        local.get 0
                        local.get 6
                        i32.store
                        br 8 (;@2;)
                      end
                      local.get 6
                      local.get 1
                      i32.add
                      local.set 1
                    end
                    local.get 1
                    local.get 10
                    i32.lt_u
                    br_if 0 (;@8;)
                  end
                  block ;; label = @8
                    local.get 10
                    local.get 1
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 24
                    i32.add
                    i32.const 0
                    i32.store
                    br 1 (;@7;)
                  end
                  local.get 1
                  local.get 10
                  i32.const 1050384
                  call $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE
                  unreachable
                end
                local.get 2
                local.get 12
                i32.add
                local.set 10
                block ;; label = @7
                  local.get 5
                  i32.load offset=16
                  local.get 5
                  i32.const 24
                  i32.add
                  local.tee 8
                  i32.load
                  local.tee 6
                  i32.sub
                  local.get 3
                  local.get 12
                  i32.sub
                  local.tee 1
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 5
                  i32.const 16
                  i32.add
                  local.get 10
                  local.get 1
                  call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc9adfdbd0f80279cE
                  br 5 (;@2;)
                end
                local.get 5
                i32.const 20
                i32.add
                i32.load
                local.get 6
                i32.add
                local.get 10
                local.get 1
                call $memcpy
                drop
                local.get 0
                i32.const 4
                i32.store8
                local.get 8
                local.get 6
                local.get 1
                i32.add
                i32.store
                br 4 (;@2;)
              end
              local.get 0
              local.get 10
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.get 13
              i64.or
              i64.store align=4
              br 3 (;@2;)
            end
            local.get 4
            i32.const 1
            i32.store offset=20
            local.get 4
            i32.const 1051028
            i32.store offset=16
            local.get 4
            i64.const 0
            i64.store offset=28 align=4
            local.get 4
            i32.const 1050112
            i32.store offset=24
            local.get 4
            i32.const 16
            i32.add
            i32.const 1051036
            call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
            unreachable
          end
          local.get 6
          local.get 1
          i32.lt_u
          br_if 2 (;@1;)
          i32.const 0
          local.set 6
          local.get 5
          i32.const 24
          i32.add
          i32.const 0
          i32.store
        end
        block ;; label = @3
          local.get 5
          i32.load offset=16
          local.get 6
          i32.sub
          local.get 3
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 5
          i32.const 16
          i32.add
          local.get 2
          local.get 3
          call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc9adfdbd0f80279cE
          br 1 (;@2;)
        end
        local.get 5
        i32.load offset=20
        local.get 6
        i32.add
        local.get 2
        local.get 3
        call $memcpy
        drop
        local.get 0
        i32.const 4
        i32.store8
        local.get 5
        i32.const 24
        i32.add
        local.get 6
        local.get 3
        i32.add
        i32.store
      end
      local.get 5
      local.get 5
      i32.load offset=12
      i32.const 1
      i32.add
      i32.store offset=12
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 1
    local.get 6
    i32.const 1050384
    call $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE
    unreachable
  )
  (func $_ZN4core3fmt5Write9write_fmt17h5d70bc4ebce664bcE (;84;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.const 1050608
    local.get 1
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
  )
  (func $_ZN4core3fmt5Write9write_fmt17h99189ac71df186ceE (;85;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.const 1050536
    local.get 1
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
  )
  (func $_ZN4core3fmt5Write9write_fmt17hac1e0a44787515a2E (;86;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.const 1050584
    local.get 1
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
  )
  (func $_ZN4core3fmt5Write9write_fmt17hbed4979c13640f0dE (;87;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.const 1050560
    local.get 1
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
  )
  (func $_ZN3std9panicking12default_hook17h833f8a94facaf05fE (;88;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load8_u offset=17
        br_if 0 (;@2;)
        block ;; label = @3
          i32.const 0
          i32.load offset=1057320
          i32.const 1
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          call $_ZN3std5panic19get_backtrace_style17hec8d1fec165d9247E
          i32.store8 offset=35
          br 2 (;@1;)
        end
        local.get 1
        i32.const 1
        i32.store8 offset=35
        br 1 (;@1;)
      end
      local.get 1
      i32.const 3
      i32.store8 offset=35
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=36
    i32.const 12
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    local.get 0
    i32.load
    local.tee 3
    local.get 0
    i32.load offset=4
    i32.const 12
    i32.add
    local.tee 4
    i32.load
    call_indirect (type 2)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i64.load offset=16
          i64.const -163230743173927068
          i64.ne
          br_if 0 (;@3;)
          i32.const 4
          local.set 0
          local.get 3
          local.set 5
          local.get 1
          i64.load offset=24
          i64.const -4493808902380553279
          i64.eq
          br_if 1 (;@2;)
        end
        local.get 1
        local.get 3
        local.get 4
        i32.load
        call_indirect (type 2)
        i32.const 1052832
        local.set 0
        local.get 1
        i64.load
        i64.const 8189784611853400225
        i64.ne
        br_if 1 (;@1;)
        local.get 1
        i64.load offset=8
        i64.const 2691881560090170292
        i64.ne
        br_if 1 (;@1;)
        local.get 3
        i32.const 4
        i32.add
        local.set 5
        i32.const 8
        local.set 0
      end
      local.get 3
      local.get 0
      i32.add
      i32.load
      local.set 2
      local.get 5
      i32.load
      local.set 0
    end
    local.get 1
    local.get 2
    i32.store offset=44
    local.get 1
    local.get 0
    i32.store offset=40
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1057328
                  local.tee 0
                  br_if 0 (;@7;)
                  call $_ZN4core4cell4once17OnceCell$LT$T$GT$15get_or_try_init13outlined_call17hd6900637c08ab975E
                  local.set 0
                  i32.const 0
                  i32.load offset=1057328
                  br_if 1 (;@6;)
                  i32.const 0
                  local.get 0
                  i32.store offset=1057328
                end
                local.get 0
                local.get 0
                i32.load
                local.tee 3
                i32.const 1
                i32.add
                i32.store
                local.get 3
                i32.const -1
                i32.le_s
                br_if 1 (;@5;)
                local.get 1
                local.get 0
                i32.store offset=48
                block ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load offset=16
                    local.tee 3
                    br_if 0 (;@8;)
                    i32.const 9
                    local.set 2
                    i32.const 1052844
                    local.set 3
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=20
                  i32.const -1
                  i32.add
                  local.set 2
                end
                local.get 1
                local.get 2
                i32.store offset=56
                local.get 1
                local.get 3
                i32.store offset=52
                local.get 1
                local.get 1
                i32.const 35
                i32.add
                i32.store offset=72
                local.get 1
                local.get 1
                i32.const 40
                i32.add
                i32.store offset=68
                local.get 1
                local.get 1
                i32.const 36
                i32.add
                i32.store offset=64
                local.get 1
                local.get 1
                i32.const 52
                i32.add
                i32.store offset=60
                block ;; label = @7
                  i32.const 0
                  i32.load8_u offset=1057247
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 0
                  i32.store offset=76
                  br 4 (;@3;)
                end
                i32.const 0
                i32.const 1
                i32.store8 offset=1057247
                block ;; label = @7
                  i32.const 0
                  i32.load8_u offset=1057336
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 1
                  i32.store8 offset=1057336
                  i32.const 0
                  i32.const 0
                  i32.store offset=1057340
                  local.get 1
                  i32.const 0
                  i32.store offset=76
                  br 4 (;@3;)
                end
                local.get 1
                i32.const 0
                i32.load offset=1057340
                local.tee 3
                i32.store offset=76
                i32.const 0
                i32.const 0
                i32.store offset=1057340
                local.get 3
                i32.eqz
                br_if 3 (;@3;)
                local.get 3
                i32.load8_u offset=8
                local.set 0
                local.get 3
                i32.const 1
                i32.store8 offset=8
                local.get 1
                local.get 0
                i32.store8 offset=83
                local.get 0
                br_if 2 (;@4;)
                local.get 1
                i32.const 60
                i32.add
                local.get 3
                i32.const 12
                i32.add
                i32.const 6
                call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h7f70e4630e295081E
                local.get 3
                i32.const 0
                i32.store8 offset=8
                i32.const 0
                i32.const 1
                i32.store8 offset=1057247
                block ;; label = @7
                  block ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1057336
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 3
                    i32.store offset=1057340
                    i32.const 0
                    i32.const 1
                    i32.store8 offset=1057336
                    br 1 (;@7;)
                  end
                  i32.const 0
                  i32.load offset=1057340
                  local.set 0
                  i32.const 0
                  local.get 3
                  i32.store offset=1057340
                  local.get 1
                  local.get 0
                  i32.store offset=84
                  local.get 0
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 0
                  i32.load
                  local.tee 3
                  i32.const -1
                  i32.add
                  i32.store
                  local.get 3
                  i32.const 1
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 84
                  i32.add
                  call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hd0b806c510bec11cE
                end
                i32.const 1
                local.set 3
                local.get 1
                i32.load offset=48
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                br 4 (;@2;)
              end
              local.get 1
              i32.const 1
              i32.store offset=88
              local.get 1
              i32.const 1050144
              i32.store offset=84
              local.get 1
              i64.const 0
              i64.store offset=96 align=4
              local.get 1
              i32.const 1050112
              i32.store offset=92
              local.get 1
              i32.const 84
              i32.add
              i32.const 1050232
              call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
              unreachable
            end
            unreachable
            unreachable
          end
          local.get 1
          i64.const 0
          i64.store offset=96 align=4
          local.get 1
          i32.const 1050112
          i32.store offset=92
          local.get 1
          i32.const 1
          i32.store offset=88
          local.get 1
          i32.const 1052148
          i32.store offset=84
          local.get 1
          i32.const 83
          i32.add
          local.get 1
          i32.const 84
          i32.add
          call $_ZN4core9panicking13assert_failed17h65fcdd92f642d8f0E
          unreachable
        end
        local.get 1
        i32.const 60
        i32.add
        local.get 1
        i32.const 111
        i32.add
        i32.const 7
        call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h7f70e4630e295081E
        i32.const 0
        local.set 3
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 2
      i32.const -1
      i32.add
      i32.store
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const 48
        i32.add
        call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h4eea5d0bfda20da8E
      end
      local.get 3
      i32.const -1
      i32.xor
      local.get 1
      i32.load offset=76
      local.tee 0
      i32.const 0
      i32.ne
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load
      local.tee 3
      i32.const -1
      i32.add
      i32.store
      local.get 3
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.const 76
      i32.add
      call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hd0b806c510bec11cE
    end
    local.get 1
    i32.const 112
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN4core3ptr122drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Sync$u2b$core..marker..Send$GT$$GT$17hbf49eedcf28d454fE (;89;) (type 1) (param i32))
  (func $_ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17haa3bd0e8b9350184E (;90;) (type 1) (param i32))
  (func $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h4eea5d0bfda20da8E (;91;) (type 1) (param i32)
    (local i32 i32)
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 16
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 20
      i32.add
      i32.load
      local.set 2
      local.get 1
      i32.const 0
      i32.store8
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.const 1
      call $__rust_dealloc
    end
    block ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 8
      call $__rust_dealloc
    end
  )
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h70e6654b85a086f1E (;92;) (type 1) (param i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
  )
  (func $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h9f6cb9c148c6a40aE (;93;) (type 1) (param i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const -2147483648
      i32.or
      i32.const -2147483648
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
  )
  (func $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb702cd6d0aaa2266E (;94;) (type 2) (param i32 i32)
    (local i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
  )
  (func $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h829402613431a284E (;95;) (type 1) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
  )
  (func $_ZN4core4cell4once17OnceCell$LT$T$GT$15get_or_try_init13outlined_call17hd6900637c08ab975E (;96;) (type 10) (result i32)
    (local i32 i32 i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 8
    i32.add
    i32.const 8
    i32.const 16
    call $_ZN5alloc4sync32arcinner_layout_for_value_layout17haa4199be581fd905E
    local.get 0
    i32.load offset=8
    local.set 1
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load offset=12
        local.tee 2
        br_if 0 (;@2;)
        local.get 1
        local.set 3
        br 1 (;@1;)
      end
      i32.const 0
      i32.load8_u offset=1057245
      drop
      local.get 2
      local.get 1
      call $__rust_alloc
      local.set 3
    end
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 0
        i32.store offset=16
        local.get 3
        i64.const 4294967297
        i64.store
        i32.const 0
        i64.load offset=1057312
        local.set 4
        loop ;; label = @3
          local.get 4
          i64.const 1
          i64.add
          local.tee 5
          i64.eqz
          br_if 2 (;@1;)
          i32.const 0
          local.get 5
          i32.const 0
          i64.load offset=1057312
          local.tee 6
          local.get 6
          local.get 4
          i64.eq
          local.tee 1
          select
          i64.store offset=1057312
          local.get 6
          local.set 4
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 5
        i64.store offset=8
        local.get 0
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 3
        return
      end
      local.get 1
      local.get 2
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    call $_ZN3std6thread8ThreadId3new9exhausted17h5970b4da630224a0E
    unreachable
  )
  (func $_ZN3std6thread8ThreadId3new9exhausted17h5970b4da630224a0E (;97;) (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1050836
    i32.store offset=8
    local.get 0
    i64.const 0
    i64.store offset=20 align=4
    local.get 0
    i32.const 1050112
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1050844
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core9panicking13assert_failed17h65fcdd92f642d8f0E (;98;) (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1050248
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    i32.const 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 1050252
    local.get 2
    i32.const 12
    i32.add
    i32.const 1050252
    local.get 1
    i32.const 1052200
    call $_ZN4core9panicking19assert_failed_inner17hcf1985c073eb6fd3E
    unreachable
  )
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17he1a8499bb7979c0aE (;99;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcf6fec71872aa233E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h13a111fb89e6aaffE
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      call $memcpy
      drop
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcf6fec71872aa233E (;100;) (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h07e6352acbc223f7E
      block ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
    unreachable
  )
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h57abe73182e9415aE (;101;) (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h13a111fb89e6aaffE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0
  )
  (func $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hd0b806c510bec11cE (;102;) (type 1) (param i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 12
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    block ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 4
      call $__rust_dealloc
    end
  )
  (func $_ZN5alloc7raw_vec11finish_grow17h07e6352acbc223f7E (;103;) (type 11) (param i32 i32 i32 i32)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1057245
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1057245
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 1
          i32.store offset=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store
  )
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hb471c0e409086755E (;104;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0eca663ca1c2f482E
  )
  (func $_ZN64_$LT$core..str..error..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h8579cca2b823a577E (;105;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=12
    local.get 1
    i32.const 1050440
    i32.const 9
    i32.const 1050449
    i32.const 11
    local.get 0
    i32.const 1050408
    i32.const 1050460
    i32.const 9
    local.get 2
    i32.const 12
    i32.add
    i32.const 1050472
    call $_ZN4core3fmt9Formatter26debug_struct_field2_finish17he716caf3601ab937E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e4bd7f75938ee9E (;106;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.store offset=8
        local.get 1
        i32.const 1050496
        i32.const 2
        local.get 2
        i32.const 8
        i32.add
        i32.const 1050500
        call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17ha586373309166b49E
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      local.get 0
      i32.store offset=12
      local.get 1
      i32.const 1050516
      i32.const 3
      local.get 2
      i32.const 12
      i32.add
      i32.const 1050520
      call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17ha586373309166b49E
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN3std3sys4sync4once10no_threads4Once4call17hf2388fc7b63495eaE (;107;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1057246
                    br_table 0 (;@8;) 2 (;@6;) 1 (;@7;) 7 (;@1;) 0 (;@8;)
                  end
                  i32.const 0
                  i32.const 2
                  i32.store8 offset=1057246
                  local.get 0
                  i32.load8_u
                  local.set 2
                  local.get 0
                  i32.const 0
                  i32.store8
                  local.get 2
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 1
                  i32.const 0
                  i32.store8 offset=39
                  block ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1057280
                    i32.const 3
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 39
                    i32.add
                    call $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17hd690685ebea1fcf8E
                    local.get 1
                    i32.load8_u offset=39
                    br_if 6 (;@2;)
                  end
                  block ;; label = @8
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1057248
                      i32.const 1057332
                      i32.eq
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.load8_u offset=1057256
                      local.set 2
                      i32.const 1
                      local.set 0
                      i32.const 0
                      i32.const 1
                      i32.store8 offset=1057256
                      local.get 2
                      br_if 7 (;@2;)
                      i32.const 0
                      i32.const 1057332
                      i32.store offset=1057248
                      br 1 (;@8;)
                    end
                    i32.const 0
                    i32.load offset=1057252
                    i32.const 1
                    i32.add
                    local.tee 0
                    i32.eqz
                    br_if 6 (;@2;)
                  end
                  i32.const 0
                  local.get 0
                  i32.store offset=1057252
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1057260
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const -1
                    i32.store offset=1057260
                    i32.const 0
                    i32.load8_u offset=1057276
                    br_if 5 (;@3;)
                    i32.const 0
                    local.set 0
                    i32.const 0
                    i32.load offset=1057272
                    local.tee 3
                    i32.eqz
                    br_if 5 (;@3;)
                    i32.const 0
                    i32.load offset=1057268
                    local.set 4
                    loop ;; label = @9
                      local.get 1
                      local.get 3
                      local.get 0
                      i32.sub
                      local.tee 5
                      i32.store offset=44
                      local.get 1
                      local.get 4
                      local.get 0
                      i32.add
                      local.tee 6
                      i32.store offset=40
                      local.get 1
                      i32.const 12
                      i32.add
                      i32.const 1
                      local.get 1
                      i32.const 40
                      i32.add
                      i32.const 1
                      call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                local.get 1
                                i32.load16_u offset=12
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                local.set 2
                                local.get 1
                                i32.load16_u offset=14
                                i32.const -8
                                i32.add
                                br_table 1 (;@13;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 4 (;@10;) 2 (;@12;)
                              end
                              local.get 1
                              i32.load offset=16
                              local.set 2
                            end
                            local.get 2
                            br_if 1 (;@11;)
                          end
                          local.get 0
                          i32.eqz
                          br_if 8 (;@3;)
                          local.get 4
                          local.get 6
                          local.get 5
                          call $memmove
                          drop
                          br 8 (;@3;)
                        end
                        local.get 2
                        local.get 0
                        i32.add
                        local.set 0
                      end
                      local.get 0
                      local.get 3
                      i32.ge_u
                      br_if 5 (;@4;)
                      br 0 (;@9;)
                    end
                  end
                  i32.const 1051868
                  call $_ZN4core4cell22panic_already_borrowed17h17ad173f4dec947aE
                  unreachable
                end
                local.get 1
                i32.const 1
                i32.store offset=16
                local.get 1
                i32.const 1053580
                i32.store offset=12
                local.get 1
                i64.const 0
                i64.store offset=24 align=4
                local.get 1
                i32.const 1050112
                i32.store offset=20
                local.get 1
                i32.const 12
                i32.add
                i32.const 1050736
                call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
                unreachable
              end
              local.get 1
              i32.const 1
              i32.store offset=16
              local.get 1
              i32.const 1053516
              i32.store offset=12
              local.get 1
              i64.const 0
              i64.store offset=24 align=4
              local.get 1
              i32.const 1050112
              i32.store offset=20
              local.get 1
              i32.const 12
              i32.add
              i32.const 1050736
              call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
              unreachable
            end
            i32.const 1052244
            call $_ZN4core6option13unwrap_failed17h5cf22e6c8f50e086E
            unreachable
          end
          local.get 3
          local.get 0
          i32.ge_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          i32.const 1050384
          call $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE
          unreachable
        end
        block ;; label = @3
          i32.const 0
          i32.load offset=1057264
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1057268
          local.get 0
          i32.const 1
          call $__rust_dealloc
        end
        i32.const 0
        i64.const 4294967296
        i64.store offset=1057264 align=4
        i32.const 0
        i32.const 0
        i32.load offset=1057260
        i32.const 1
        i32.add
        i32.store offset=1057260
        i32.const 0
        i32.const 0
        i32.load offset=1057252
        i32.const -1
        i32.add
        local.tee 0
        i32.store offset=1057252
        i32.const 0
        i32.const 0
        i32.store8 offset=1057276
        i32.const 0
        i32.const 0
        i32.store offset=1057272
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store8 offset=1057256
        i32.const 0
        i32.const 0
        i32.store offset=1057248
      end
      i32.const 0
      i32.const 3
      i32.store8 offset=1057246
    end
    local.get 1
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN3std2rt19lang_start_internal17h8f61396649e22e0eE (;108;) (type 12) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 20
    i32.add
    i32.const 1050632
    i32.const 4
    call $_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h0a9657406ab05731E
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 5
            i32.load offset=20
            i32.const -2147483648
            i32.ne
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=28
            local.set 6
            local.get 5
            i32.load offset=24
            local.set 7
            local.get 5
            i32.const 8
            i32.add
            i32.const 8
            i32.const 16
            call $_ZN5alloc4sync32arcinner_layout_for_value_layout17haa4199be581fd905E
            local.get 5
            i32.load offset=8
            local.set 8
            block ;; label = @5
              block ;; label = @6
                local.get 5
                i32.load offset=12
                local.tee 9
                br_if 0 (;@6;)
                local.get 8
                local.set 10
                br 1 (;@5;)
              end
              i32.const 0
              i32.load8_u offset=1057245
              drop
              local.get 9
              local.get 8
              call $__rust_alloc
              local.set 10
            end
            local.get 10
            i32.eqz
            br_if 2 (;@2;)
            local.get 10
            local.get 6
            i32.store offset=20
            local.get 10
            local.get 7
            i32.store offset=16
            local.get 10
            i64.const 4294967297
            i64.store
            i32.const 0
            i64.load offset=1057312
            local.set 11
            loop ;; label = @5
              local.get 11
              i64.const 1
              i64.add
              local.tee 12
              i64.eqz
              br_if 4 (;@1;)
              i32.const 0
              local.get 12
              i32.const 0
              i64.load offset=1057312
              local.tee 13
              local.get 13
              local.get 11
              i64.eq
              local.tee 8
              select
              i64.store offset=1057312
              local.get 13
              local.set 11
              local.get 8
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 10
            local.get 12
            i64.store offset=8
            i32.const 0
            i32.load offset=1057328
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.const 1
            i32.store offset=60
            local.get 5
            i32.const 1052672
            i32.store offset=56
            local.get 5
            i64.const 0
            i64.store offset=68 align=4
            local.get 5
            local.get 5
            i32.const 48
            i32.add
            i32.store offset=64
            local.get 5
            i32.const 20
            i32.add
            local.get 5
            i32.const 48
            i32.add
            local.get 5
            i32.const 56
            i32.add
            call $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E
            local.get 5
            i32.load8_u offset=20
            local.get 5
            i32.load offset=24
            call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb702cd6d0aaa2266E
            call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
            unreachable
          end
          local.get 5
          local.get 5
          i32.const 20
          i32.add
          i32.store offset=36
          local.get 5
          i32.const 2
          i32.store offset=60
          local.get 5
          i32.const 1050696
          i32.store offset=56
          local.get 5
          i64.const 1
          i64.store offset=68 align=4
          local.get 5
          i32.const 8
          i32.store offset=52
          local.get 5
          local.get 5
          i32.const 48
          i32.add
          i32.store offset=64
          local.get 5
          local.get 5
          i32.const 36
          i32.add
          i32.store offset=48
          local.get 5
          i32.const 40
          i32.add
          local.get 5
          i32.const 48
          i32.add
          local.get 5
          i32.const 56
          i32.add
          call $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E
          local.get 5
          i32.load8_u offset=40
          local.get 5
          i32.load offset=44
          call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb702cd6d0aaa2266E
          call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
          unreachable
        end
        i32.const 0
        local.get 10
        i32.store offset=1057328
        local.get 0
        local.get 1
        i32.const 20
        i32.add
        i32.load
        call_indirect (type 3)
        local.set 8
        block ;; label = @3
          i32.const 0
          i32.load8_u offset=1057246
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          i32.const 1
          i32.store8 offset=56
          local.get 5
          i32.const 56
          i32.add
          call $_ZN3std3sys4sync4once10no_threads4Once4call17hf2388fc7b63495eaE
        end
        local.get 5
        i32.const 80
        i32.add
        global.set $__stack_pointer
        local.get 8
        return
      end
      local.get 8
      local.get 9
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    call $_ZN3std6thread8ThreadId3new9exhausted17h5970b4da630224a0E
    unreachable
  )
  (func $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E (;109;) (type 6) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 4
    i32.store8
    local.get 3
    local.get 1
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 1050560
          local.get 2
          call $_ZN4core3fmt5write17h5aa565b06adfe6beE
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load8_u
          i32.const 4
          i32.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 1052060
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        i32.const 4
        i32.store8
        local.get 3
        i32.load offset=4
        local.set 1
        block ;; label = @3
          local.get 3
          i32.load8_u
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 1
        i32.load
        local.tee 2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.load
        call_indirect (type 1)
        block ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          local.get 0
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $__rust_dealloc
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i64.load
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E (;110;) (type 0)
    call $abort
    unreachable
  )
  (func $_ZN3std3env11current_dir17h54d12e953966c725E (;111;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1057245
    drop
    i32.const 512
    local.set 2
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            i32.const 512
            i32.const 1
            call $__rust_alloc
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            i32.store offset=4
            local.get 1
            i32.const 512
            i32.store
            local.get 3
            i32.const 512
            call $getcwd
            br_if 1 (;@3;)
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1057840
                  local.tee 2
                  i32.const 68
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 512
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 0
                local.get 2
                i32.store offset=8
                local.get 0
                i64.const 2147483648
                i64.store align=4
                i32.const 512
                local.set 2
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 1
                local.get 2
                i32.store offset=8
                local.get 1
                local.get 2
                i32.const 1
                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h13a111fb89e6aaffE
                local.get 1
                i32.load offset=4
                local.tee 3
                local.get 1
                i32.load
                local.tee 2
                call $getcwd
                br_if 3 (;@3;)
                i32.const 0
                i32.load offset=1057840
                local.tee 4
                i32.const 68
                i32.eq
                br_if 0 (;@6;)
              end
              local.get 0
              local.get 4
              i32.store offset=8
              local.get 0
              i64.const 2147483648
              i64.store align=4
              local.get 2
              i32.eqz
              br_if 3 (;@2;)
            end
            local.get 3
            local.get 2
            i32.const 1
            call $__rust_dealloc
            br 2 (;@2;)
          end
          i32.const 1
          i32.const 512
          call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
          unreachable
        end
        local.get 1
        local.get 3
        call $strlen
        local.tee 4
        i32.store offset=8
        block ;; label = @3
          local.get 2
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              i32.const 1
              local.set 5
              local.get 3
              local.get 2
              i32.const 1
              call $__rust_dealloc
              br 1 (;@4;)
            end
            local.get 3
            local.get 2
            i32.const 1
            local.get 4
            call $__rust_realloc
            local.tee 5
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 1
          local.get 4
          i32.store
          local.get 1
          local.get 5
          i32.store offset=4
        end
        local.get 0
        local.get 1
        i64.load
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 1
        i32.const 8
        i32.add
        i32.load
        i32.store
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1
    local.get 4
    call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
    unreachable
  )
  (func $_ZN3std3env7_var_os17h2ae2b5d04ee9b40fE (;112;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 416
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            i32.const 383
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 20
            i32.add
            local.get 1
            local.get 2
            call $memcpy
            drop
            local.get 3
            i32.const 20
            i32.add
            local.get 2
            i32.add
            i32.const 0
            i32.store8
            local.get 3
            i32.const 404
            i32.add
            local.get 3
            i32.const 20
            i32.add
            local.get 2
            i32.const 1
            i32.add
            call $_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h389f87c8a9712d83E
            block ;; label = @5
              local.get 3
              i32.load offset=404
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 3
                i32.load offset=408
                call $getenv
                local.tee 1
                br_if 0 (;@6;)
                i32.const -2147483648
                local.set 2
                br 3 (;@3;)
              end
              block ;; label = @6
                block ;; label = @7
                  local.get 1
                  call $strlen
                  local.tee 2
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 2
                i32.const 0
                i32.lt_s
                br_if 4 (;@2;)
                i32.const 0
                i32.load8_u offset=1057245
                drop
                local.get 2
                i32.const 1
                call $__rust_alloc
                local.tee 4
                i32.eqz
                br_if 5 (;@1;)
              end
              local.get 4
              local.get 1
              local.get 2
              call $memcpy
              local.set 1
              local.get 3
              local.get 2
              i32.store offset=16
              local.get 3
              local.get 1
              i32.store offset=12
              br 2 (;@3;)
            end
            local.get 3
            i32.const 0
            i64.load offset=1052440
            i64.store offset=12 align=4
            i32.const -2147483647
            local.set 2
            br 1 (;@3;)
          end
          local.get 3
          i32.const 8
          i32.add
          local.get 1
          local.get 2
          call $_ZN3std3sys3pal6common14small_c_string24run_with_cstr_allocating17h978ef3b613e931a1E
          local.get 3
          i32.load offset=8
          local.set 2
        end
        block ;; label = @3
          block ;; label = @4
            local.get 2
            i32.const -2147483647
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            i64.load offset=12 align=4
            i64.store offset=4 align=4
            local.get 0
            local.get 2
            i32.store
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 3
            i32.load8_u offset=12
            i32.const 3
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            i32.load offset=16
            local.tee 2
            i32.load
            local.tee 4
            local.get 2
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            call_indirect (type 1)
            block ;; label = @5
              local.get 1
              i32.load offset=4
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              local.get 5
              local.get 1
              i32.load offset=8
              call $__rust_dealloc
            end
            local.get 2
            i32.const 12
            i32.const 4
            call $__rust_dealloc
          end
          local.get 0
          i32.const -2147483648
          i32.store
        end
        local.get 3
        i32.const 416
        i32.add
        global.set $__stack_pointer
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
      unreachable
    end
    i32.const 1
    local.get 2
    call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
    unreachable
  )
  (func $_ZN3std3sys3pal6common14small_c_string24run_with_cstr_allocating17h978ef3b613e931a1E (;113;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    local.get 2
    call $_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h0a9657406ab05731E
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.load
            local.tee 2
            i32.const -2147483648
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            i32.load offset=8
            local.set 1
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.load offset=4
                local.tee 4
                call $getenv
                local.tee 5
                br_if 0 (;@6;)
                local.get 0
                i32.const -2147483648
                i32.store
                br 1 (;@5;)
              end
              block ;; label = @6
                block ;; label = @7
                  local.get 5
                  call $strlen
                  local.tee 2
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 6
                  br 1 (;@6;)
                end
                local.get 2
                i32.const 0
                i32.lt_s
                br_if 3 (;@3;)
                i32.const 0
                i32.load8_u offset=1057245
                drop
                local.get 2
                i32.const 1
                call $__rust_alloc
                local.tee 6
                i32.eqz
                br_if 4 (;@2;)
              end
              local.get 6
              local.get 5
              local.get 2
              call $memcpy
              local.set 5
              local.get 0
              local.get 2
              i32.store offset=8
              local.get 0
              local.get 5
              i32.store offset=4
              local.get 0
              local.get 2
              i32.store
            end
            local.get 4
            i32.const 0
            i32.store8
            local.get 1
            i32.eqz
            br_if 3 (;@1;)
            local.get 4
            local.get 1
            i32.const 1
            call $__rust_dealloc
            br 3 (;@1;)
          end
          local.get 0
          i32.const -2147483647
          i32.store
          local.get 0
          i32.const 0
          i64.load offset=1052440
          i64.store offset=4 align=4
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.load offset=4
          local.get 2
          i32.const 1
          call $__rust_dealloc
          br 2 (;@1;)
        end
        call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
        unreachable
      end
      i32.const 1
      local.get 2
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17h929aeea2aebd3221E (;114;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.load8_u
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;) 0 (;@5;)
            end
            local.get 2
            local.get 0
            i32.load offset=4
            local.tee 0
            i32.store offset=8
            local.get 2
            i32.const 12
            i32.add
            local.get 0
            call $_ZN3std3sys3pal4wasi2os12error_string17hd68b13cd1c822303E
            local.get 2
            i32.const 36
            i32.add
            i32.const 9
            i32.store
            local.get 2
            i32.const 3
            i32.store offset=44
            local.get 2
            i32.const 1051816
            i32.store offset=40
            local.get 2
            i64.const 2
            i64.store offset=52 align=4
            local.get 2
            i32.const 10
            i32.store offset=28
            local.get 2
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=48
            local.get 2
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=32
            local.get 2
            local.get 2
            i32.const 12
            i32.add
            i32.store offset=24
            local.get 1
            i32.load offset=20
            local.get 1
            i32.load offset=24
            local.get 2
            i32.const 40
            i32.add
            call $_ZN4core3fmt5write17h5aa565b06adfe6beE
            local.set 0
            local.get 2
            i32.load offset=12
            local.tee 1
            i32.eqz
            br_if 3 (;@1;)
            local.get 2
            i32.load offset=16
            local.get 1
            i32.const 1
            call $__rust_dealloc
            br 3 (;@1;)
          end
          local.get 0
          i32.load8_u offset=1
          local.set 0
          local.get 2
          i32.const 1
          i32.store offset=44
          local.get 2
          i32.const 1050964
          i32.store offset=40
          local.get 2
          i64.const 1
          i64.store offset=52 align=4
          local.get 2
          i32.const 11
          i32.store offset=16
          local.get 2
          local.get 0
          i32.const 2
          i32.shl
          local.tee 0
          i32.const 1053644
          i32.add
          i32.load
          i32.store offset=28
          local.get 2
          local.get 0
          i32.const 1053808
          i32.add
          i32.load
          i32.store offset=24
          local.get 2
          local.get 2
          i32.const 12
          i32.add
          i32.store offset=48
          local.get 2
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=12
          local.get 1
          i32.load offset=20
          local.get 1
          i32.load offset=24
          local.get 2
          i32.const 40
          i32.add
          call $_ZN4core3fmt5write17h5aa565b06adfe6beE
          local.set 0
          br 2 (;@1;)
        end
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 0
        i32.load offset=4
        local.get 1
        call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0eca663ca1c2f482E
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=4
      local.tee 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=16
      call_indirect (type 4)
      local.set 0
    end
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc9adfdbd0f80279cE (;115;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.load
          local.tee 5
          local.get 1
          i32.load offset=8
          local.tee 6
          i32.sub
          local.get 3
          i32.ge_u
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 6
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=4
          local.set 7
          i32.const 0
          local.set 8
          loop ;; label = @4
            local.get 4
            local.get 6
            local.get 8
            i32.sub
            local.tee 9
            i32.store offset=4
            local.get 4
            local.get 7
            local.get 8
            i32.add
            local.tee 10
            i32.store
            local.get 4
            i32.const 8
            i32.add
            i32.const 1
            local.get 4
            i32.const 1
            call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 4
                      i32.load16_u offset=8
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 9
                      local.set 11
                      local.get 4
                      i32.load16_u offset=10
                      local.tee 12
                      i32.const 8
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 1
                      i32.const 0
                      i32.store8 offset=12
                      local.get 12
                      i32.const 27
                      i32.eq
                      br_if 4 (;@5;)
                      i32.const 0
                      local.set 3
                      br 2 (;@7;)
                    end
                    local.get 4
                    i32.load offset=12
                    local.set 11
                  end
                  local.get 1
                  i32.const 0
                  i32.store8 offset=12
                  local.get 11
                  br_if 1 (;@6;)
                  i32.const 2
                  local.set 3
                  i32.const 1050952
                  local.set 12
                end
                block ;; label = @7
                  local.get 8
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 10
                  local.get 9
                  call $memmove
                  drop
                  local.get 1
                  local.get 9
                  i32.store offset=8
                end
                local.get 0
                local.get 12
                i32.store offset=4
                local.get 0
                local.get 3
                i32.store
                br 4 (;@2;)
              end
              local.get 11
              local.get 8
              i32.add
              local.set 8
            end
            local.get 8
            local.get 6
            i32.lt_u
            br_if 0 (;@4;)
          end
          local.get 6
          local.get 8
          i32.lt_u
          br_if 2 (;@1;)
          i32.const 0
          local.set 6
          local.get 1
          i32.const 0
          i32.store offset=8
        end
        block ;; label = @3
          local.get 5
          local.get 3
          i32.le_u
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=4
          local.get 6
          i32.add
          local.get 2
          local.get 3
          call $memcpy
          drop
          local.get 0
          i32.const 4
          i32.store8
          local.get 1
          local.get 6
          local.get 3
          i32.add
          i32.store offset=8
          br 1 (;@2;)
        end
        i64.const 0
        local.set 13
        i64.const 4
        local.set 14
        block ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 4
            local.get 3
            i32.store offset=4
            local.get 4
            local.get 2
            i32.store
            local.get 4
            i32.const 8
            i32.add
            i32.const 1
            local.get 4
            i32.const 1
            call $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 4
                    i32.load16_u offset=8
                    br_if 0 (;@8;)
                    block ;; label = @9
                      local.get 4
                      i32.load offset=12
                      local.tee 8
                      br_if 0 (;@9;)
                      i32.const 1052016
                      local.set 8
                      i64.const 2
                      local.set 13
                      br 2 (;@7;)
                    end
                    local.get 3
                    local.get 8
                    i32.lt_u
                    br_if 2 (;@6;)
                    local.get 2
                    local.get 8
                    i32.add
                    local.set 2
                    local.get 3
                    local.get 8
                    i32.sub
                    local.set 3
                    br 3 (;@5;)
                  end
                  local.get 4
                  i32.load16_u offset=10
                  local.tee 8
                  i32.const 27
                  i32.eq
                  br_if 2 (;@5;)
                  i64.const 0
                  local.set 13
                  local.get 8
                  i32.const 8
                  i32.eq
                  br_if 4 (;@3;)
                end
                local.get 13
                local.set 14
                local.get 8
                i64.extend_i32_u
                i64.const 32
                i64.shl
                local.set 13
                br 3 (;@3;)
              end
              local.get 8
              local.get 3
              i32.const 1052028
              call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
              unreachable
            end
            local.get 3
            br_if 0 (;@4;)
          end
        end
        local.get 1
        i32.const 0
        i32.store8 offset=12
        local.get 0
        local.get 13
        local.get 14
        i64.or
        i64.store align=4
      end
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 8
    local.get 6
    i32.const 1050384
    call $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE
    unreachable
  )
  (func $_ZN3std3sys3pal4wasi2os12error_string17hd68b13cd1c822303E (;116;) (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 1056
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          local.get 2
          i32.const 0
          i32.const 1024
          call $memset
          local.tee 2
          i32.const 1024
          call $strerror_r
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 2
          i32.const 1024
          i32.add
          local.get 2
          local.get 2
          call $strlen
          call $_ZN4core3str8converts9from_utf817ha5a496e5d6c22d13E
          block ;; label = @4
            local.get 2
            i32.load offset=1024
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=1028
            local.set 3
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i32.load offset=1032
                local.tee 1
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 1 (;@5;)
              end
              local.get 1
              i32.const 0
              i32.lt_s
              br_if 3 (;@2;)
              i32.const 0
              i32.load8_u offset=1057245
              drop
              local.get 1
              i32.const 1
              call $__rust_alloc
              local.tee 4
              i32.eqz
              br_if 4 (;@1;)
            end
            local.get 4
            local.get 3
            local.get 1
            call $memcpy
            local.set 3
            local.get 0
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            local.get 1
            i32.store
            local.get 2
            i32.const 1056
            i32.add
            global.set $__stack_pointer
            return
          end
          local.get 2
          local.get 2
          i64.load offset=1028 align=4
          i64.store offset=1048
          i32.const 1050874
          i32.const 43
          local.get 2
          i32.const 1048
          i32.add
          i32.const 1053360
          i32.const 1053412
          call $_ZN4core6result13unwrap_failed17h30d23efcc9e41efcE
          unreachable
        end
        local.get 2
        i32.const 1
        i32.store offset=1028
        local.get 2
        i32.const 1053448
        i32.store offset=1024
        local.get 2
        i64.const 0
        i64.store offset=1036 align=4
        local.get 2
        i32.const 1050112
        i32.store offset=1032
        local.get 2
        i32.const 1024
        i32.add
        i32.const 1053456
        call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
        unreachable
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
      unreachable
    end
    i32.const 1
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
    unreachable
  )
  (func $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17hfae57a5b0af0bb36E (;117;) (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=1057280
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 1057248
      i32.store offset=4
      local.get 0
      local.get 0
      i32.const 15
      i32.add
      i32.store offset=8
      local.get 0
      i32.const 4
      i32.add
      call $_ZN3std3sys4sync4once10no_threads4Once4call17hcb1b2dcb4011cc52E
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hec023710ca1d85aaE (;118;) (type 6) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.load
          i32.load
          local.tee 1
          i32.load
          i32.const 1057332
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u offset=8
          local.set 4
          local.get 1
          i32.const 1
          i32.store8 offset=8
          local.get 3
          local.get 4
          i32.store8 offset=4
          local.get 4
          i32.eqz
          br_if 1 (;@2;)
          local.get 3
          i64.const 0
          i64.store offset=20 align=4
          local.get 3
          i32.const 1050112
          i32.store offset=16
          local.get 3
          i32.const 1
          i32.store offset=12
          local.get 3
          i32.const 1052148
          i32.store offset=8
          local.get 3
          i32.const 4
          i32.add
          local.get 3
          i32.const 8
          i32.add
          call $_ZN4core9panicking13assert_failed17h65fcdd92f642d8f0E
          unreachable
        end
        block ;; label = @3
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.add
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 4
          i32.store offset=4
          br 2 (;@1;)
        end
        i32.const 1052292
        i32.const 38
        i32.const 1052368
        call $_ZN4core6option13expect_failed17hd052156a34080ddaE
        unreachable
      end
      local.get 1
      i32.const 1
      i32.store offset=4
      local.get 1
      i32.const 1057332
      i32.store
    end
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 4
    i32.store8 offset=8
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 8
          i32.add
          i32.const 1050536
          local.get 2
          call $_ZN4core3fmt5write17h5aa565b06adfe6beE
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load8_u offset=8
          i32.const 4
          i32.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 1052060
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        i32.const 4
        i32.store8
        local.get 3
        i32.load offset=12
        local.set 0
        block ;; label = @3
          local.get 3
          i32.load8_u offset=8
          local.tee 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 0
        i32.load
        local.tee 2
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.const 12
        i32.const 4
        call $__rust_dealloc
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i64.load offset=8
      i64.store align=4
    end
    local.get 3
    i32.load offset=4
    local.tee 1
    local.get 1
    i32.load offset=4
    i32.const -1
    i32.add
    local.tee 0
    i32.store offset=4
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      i32.const 0
      i32.store8 offset=8
      local.get 1
      i32.const 0
      i32.store
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN3std2io5stdio31print_to_buffer_if_capture_used17hc72099889e197275E (;119;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load8_u offset=1057247
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        block ;; label = @3
          i32.const 0
          i32.load8_u offset=1057336
          br_if 0 (;@3;)
          i32.const 0
          i32.const 1
          i32.store8 offset=1057336
          i32.const 0
          i32.const 0
          i32.store offset=1057340
          br 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1057340
        local.set 3
        i32.const 0
        i32.const 0
        i32.store offset=1057340
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u offset=8
        local.set 2
        local.get 3
        i32.const 1
        i32.store8 offset=8
        local.get 1
        local.get 2
        i32.store8 offset=7
        local.get 2
        br_if 1 (;@1;)
        local.get 1
        i32.const 4
        i32.store8 offset=8
        local.get 1
        local.get 3
        i32.const 12
        i32.add
        i32.store offset=16
        local.get 1
        i32.const 8
        i32.add
        i32.const 1050608
        local.get 0
        call $_ZN4core3fmt5write17h5aa565b06adfe6beE
        local.set 0
        local.get 1
        i32.load8_u offset=8
        local.set 2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 4
            i32.eq
            br_if 1 (;@3;)
            local.get 1
            i32.load offset=12
            local.set 0
            block ;; label = @5
              local.get 1
              i32.load8_u offset=8
              local.tee 2
              i32.const 4
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 3
              i32.ne
              br_if 2 (;@3;)
            end
            local.get 0
            i32.load
            local.tee 4
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 2
            i32.load
            call_indirect (type 1)
            block ;; label = @5
              local.get 2
              i32.load offset=4
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              local.get 5
              local.get 2
              i32.load offset=8
              call $__rust_dealloc
            end
            local.get 0
            i32.const 12
            i32.const 4
            call $__rust_dealloc
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=12
          local.set 0
          block ;; label = @4
            local.get 2
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          i32.load
          local.tee 4
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.load
          call_indirect (type 1)
          block ;; label = @4
            local.get 2
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            local.get 2
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 3
        i32.const 0
        i32.store8 offset=8
        i32.const 0
        i32.load offset=1057340
        local.set 2
        i32.const 0
        local.get 3
        i32.store offset=1057340
        local.get 1
        local.get 2
        i32.store offset=8
        block ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 2
          i32.load
          local.tee 3
          i32.const -1
          i32.add
          i32.store
          local.get 3
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 8
          i32.add
          call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hd0b806c510bec11cE
        end
        i32.const 1
        local.set 2
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 2
      return
    end
    local.get 1
    i64.const 0
    i64.store offset=20 align=4
    local.get 1
    i32.const 1050112
    i32.store offset=16
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1052148
    i32.store offset=8
    local.get 1
    i32.const 7
    i32.add
    local.get 1
    i32.const 8
    i32.add
    call $_ZN4core9panicking13assert_failed17h65fcdd92f642d8f0E
    unreachable
  )
  (func $_ZN3std2io5stdio6_print17h22fc2cf0228ddb4cE (;120;) (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 6
    i32.store offset=12
    local.get 1
    i32.const 1051956
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        local.get 0
        call $_ZN3std2io5stdio31print_to_buffer_if_capture_used17hc72099889e197275E
        br_if 0 (;@2;)
        block ;; label = @3
          i32.const 0
          i32.load8_u offset=1057280
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          call $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17hfae57a5b0af0bb36E
        end
        local.get 1
        i32.const 1057248
        i32.store offset=28
        local.get 1
        local.get 1
        i32.const 28
        i32.add
        i32.store offset=40
        local.get 1
        i32.const 16
        i32.add
        local.get 1
        i32.const 40
        i32.add
        local.get 0
        call $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hec023710ca1d85aaE
        local.get 1
        i32.load8_u offset=16
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 80
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 1
    local.get 1
    i64.load offset=16
    i64.store offset=32
    local.get 1
    i32.const 76
    i32.add
    i32.const 12
    i32.store
    local.get 1
    i32.const 2
    i32.store offset=44
    local.get 1
    i32.const 1051924
    i32.store offset=40
    local.get 1
    i64.const 2
    i64.store offset=52 align=4
    local.get 1
    i32.const 11
    i32.store offset=68
    local.get 1
    local.get 1
    i32.const 64
    i32.add
    i32.store offset=48
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=72
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=64
    local.get 1
    i32.const 40
    i32.add
    i32.const 1051940
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN3std2io5Write9write_fmt17h76571f83421c996cE (;121;) (type 6) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 4
    i32.store8
    local.get 3
    local.get 1
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 1050608
          local.get 2
          call $_ZN4core3fmt5write17h5aa565b06adfe6beE
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load8_u
          i32.const 4
          i32.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 1052060
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        i32.const 4
        i32.store8
        local.get 3
        i32.load offset=4
        local.set 1
        block ;; label = @3
          local.get 3
          i32.load8_u
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 1
        i32.load
        local.tee 2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.load
        call_indirect (type 1)
        block ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          local.get 0
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $__rust_dealloc
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i64.load
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h033331596459965eE (;122;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 1
    local.get 2
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17hd88402d4acde7ae8E
    block ;; label = @1
      local.get 3
      i32.load8_u offset=8
      local.tee 2
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 4
      local.get 3
      i64.load offset=8
      local.set 5
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 4
        i32.load
        local.tee 6
        local.get 4
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 4
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 5
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.const 4
    i32.ne
  )
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hf36efb2c172acdd0E (;123;) (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h13a111fb89e6aaffE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0
  )
  (func $_ZN3std5panic19get_backtrace_style17hec8d1fec165d9247E (;124;) (type 10) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 1
    local.set 1
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load8_u offset=1057284
              br_table 3 (;@2;) 1 (;@4;) 4 (;@1;) 2 (;@3;) 0 (;@5;)
            end
            i32.const 1050268
            i32.const 40
            i32.const 1052096
            call $_ZN4core9panicking5panic17h0d08f040be55464aE
            unreachable
          end
          i32.const 0
          local.set 1
          br 2 (;@1;)
        end
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.add
      i32.const 1050860
      i32.const 14
      call $_ZN3std3env7_var_os17h2ae2b5d04ee9b40fE
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 2
          i32.const -2147483648
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          local.get 0
          i32.load offset=8
          local.set 3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load offset=12
                i32.const -1
                i32.add
                br_table 0 (;@6;) 2 (;@4;) 2 (;@4;) 1 (;@5;) 2 (;@4;)
              end
              local.get 3
              i32.load8_u
              i32.const 48
              i32.eq
              i32.const 1
              i32.shl
              local.set 1
              br 1 (;@4;)
            end
            local.get 3
            i32.const 1052112
            i32.const 4
            call $memcmp
            i32.eqz
            local.set 1
          end
          block ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 2
            i32.const 1
            call $__rust_dealloc
          end
          local.get 1
          i32.const 1
          i32.add
          local.set 2
          br 1 (;@2;)
        end
        i32.const 3
        local.set 2
        i32.const 2
        local.set 1
      end
      i32.const 0
      local.get 2
      i32.store8 offset=1057284
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $_ZN3std7process5abort17haa0f109eaf5171f4E (;125;) (type 0)
    call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
    unreachable
  )
  (func $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17hd690685ebea1fcf8E (;126;) (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=1057280
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.const 1057248
      i32.store offset=4
      local.get 1
      local.get 0
      i32.store
      local.get 1
      local.get 1
      i32.const 15
      i32.add
      i32.store offset=8
      local.get 1
      call $_ZN3std3sys4sync4once10no_threads4Once4call17hc17292ed4c89f3eeE
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN3std3sys4sync4once10no_threads4Once4call17hc17292ed4c89f3eeE (;127;) (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load8_u offset=1057280
            local.tee 2
            i32.const 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const -2
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;)
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1057280
          local.get 0
          i32.load
          local.set 2
          local.get 0
          i32.const 0
          i32.store
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          local.set 0
          local.get 2
          i32.const 1
          i32.store8
          local.get 0
          i32.const 8
          i32.add
          i32.const 0
          i32.store8
          local.get 0
          i64.const 0
          i64.store align=4
          local.get 0
          i32.const 0
          i32.store8 offset=28
          local.get 0
          i64.const 1
          i64.store offset=20 align=4
          local.get 0
          i64.const 0
          i64.store offset=12 align=4
          i32.const 0
          i32.const 3
          i32.store8 offset=1057280
        end
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1052276
      call $_ZN4core6option13unwrap_failed17h5cf22e6c8f50e086E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1053580
    i32.store offset=8
    local.get 1
    i64.const 0
    i64.store offset=20 align=4
    local.get 1
    i32.const 1050112
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 1052260
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN3std3sys4sync4once10no_threads4Once4call17hcb1b2dcb4011cc52E (;128;) (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load8_u offset=1057280
              local.tee 2
              i32.const 2
              i32.lt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const -2
              i32.add
              br_table 4 (;@1;) 1 (;@4;) 4 (;@1;)
            end
            i32.const 0
            i32.const 2
            i32.store8 offset=1057280
            local.get 0
            i32.load
            local.set 2
            local.get 0
            i32.const 0
            i32.store
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            i32.const 0
            i32.load8_u offset=1057245
            drop
            i32.const 1024
            i32.const 1
            call $__rust_alloc
            local.tee 0
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            i64.const 0
            i64.store align=4
            local.get 2
            i32.const 0
            i32.store8 offset=28
            local.get 2
            i32.const 0
            i32.store offset=24
            local.get 2
            local.get 0
            i32.store offset=20
            local.get 2
            i64.const 4398046511104
            i64.store offset=12 align=4
            local.get 2
            i32.const 8
            i32.add
            i32.const 0
            i32.store8
            i32.const 0
            i32.const 3
            i32.store8 offset=1057280
          end
          local.get 1
          i32.const 32
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1052276
        call $_ZN4core6option13unwrap_failed17h5cf22e6c8f50e086E
        unreachable
      end
      i32.const 1
      i32.const 1024
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1053580
    i32.store offset=8
    local.get 1
    i64.const 0
    i64.store offset=20 align=4
    local.get 1
    i32.const 1050112
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 1052260
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN91_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h68f72991cc0e9004E (;129;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i64 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.load offset=24
    local.set 3
    local.get 1
    i32.load offset=20
    local.set 4
    local.get 0
    i32.load8_u
    local.set 0
    local.get 2
    i32.const 4
    i32.add
    call $_ZN3std3env11current_dir17h54d12e953966c725E
    local.get 2
    i64.load offset=8 align=4
    local.set 5
    block ;; label = @1
      local.get 2
      i32.load offset=4
      local.tee 1
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 5
      i64.const 255
      i64.and
      i64.const 3
      i64.ne
      br_if 0 (;@1;)
      local.get 5
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      local.tee 6
      i32.load
      local.tee 7
      local.get 6
      i32.const 4
      i32.add
      i32.load
      local.tee 8
      i32.load
      call_indirect (type 1)
      block ;; label = @2
        local.get 8
        i32.load offset=4
        local.tee 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 7
        local.get 9
        local.get 8
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 6
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 4
          i32.const 1052448
          i32.const 17
          local.get 3
          i32.load offset=12
          local.tee 3
          call_indirect (type 5)
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 0
            i32.const 255
            i32.and
            br_if 0 (;@4;)
            local.get 4
            i32.const 1052465
            i32.const 88
            local.get 3
            call_indirect (type 5)
            br_if 1 (;@3;)
          end
          i32.const 0
          local.set 4
          local.get 1
          i32.const -2147483648
          i32.or
          i32.const -2147483648
          i32.eq
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 1
        i32.const -2147483648
        i32.or
        i32.const -2147483648
        i32.eq
        br_if 1 (;@1;)
      end
      local.get 5
      i32.wrap_i64
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17h5691573a73161cb1E (;130;) (type 1) (param i32)
    local.get 0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h4d99b90b43f79472E
    unreachable
  )
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h4d99b90b43f79472E (;131;) (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.load offset=12
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 3
          br_if 1 (;@2;)
          i32.const 1050112
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store offset=12
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      i32.const 1053068
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.load offset=8
      local.get 0
      i32.load offset=8
      local.get 2
      i32.load8_u offset=16
      local.get 2
      i32.load8_u offset=17
      call $_ZN3std9panicking20rust_panic_with_hook17hd3fb69bc0aea298aE
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 1053048
    local.get 0
    i32.load offset=4
    local.tee 2
    i32.load offset=8
    local.get 0
    i32.load offset=8
    local.get 2
    i32.load8_u offset=16
    local.get 2
    i32.load8_u offset=17
    call $_ZN3std9panicking20rust_panic_with_hook17hd3fb69bc0aea298aE
    unreachable
  )
  (func $_ZN3std5alloc24default_alloc_error_hook17h026737e940a258acE (;132;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=1057244
      br_if 0 (;@1;)
      local.get 2
      i32.const 2
      i32.store offset=16
      local.get 2
      i32.const 1052716
      i32.store offset=12
      local.get 2
      i64.const 1
      i64.store offset=24 align=4
      local.get 2
      i32.const 13
      i32.store offset=40
      local.get 2
      local.get 1
      i32.store offset=44
      local.get 2
      local.get 2
      i32.const 36
      i32.add
      i32.store offset=20
      local.get 2
      local.get 2
      i32.const 44
      i32.add
      i32.store offset=36
      local.get 2
      i32.const 4
      i32.store8 offset=48
      local.get 2
      local.get 2
      i32.const 63
      i32.add
      i32.store offset=56
      local.get 2
      i32.const 48
      i32.add
      i32.const 1050560
      local.get 2
      i32.const 12
      i32.add
      call $_ZN4core3fmt5write17h5aa565b06adfe6beE
      local.set 3
      local.get 2
      i32.load8_u offset=48
      local.set 1
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 4
          i32.eq
          br_if 1 (;@2;)
          local.get 2
          i32.load offset=52
          local.set 3
          block ;; label = @4
            local.get 2
            i32.load8_u offset=48
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 3
          i32.load
          local.tee 4
          local.get 3
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 3
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 2
        i32.load offset=52
        local.set 3
        block ;; label = @3
          local.get 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load
        local.tee 4
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 3
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 2
      i32.const 64
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 2
    i32.store offset=16
    local.get 2
    i32.const 1052748
    i32.store offset=12
    local.get 2
    i64.const 1
    i64.store offset=24 align=4
    local.get 2
    i32.const 13
    i32.store offset=52
    local.get 2
    local.get 1
    i32.store offset=36
    local.get 2
    local.get 2
    i32.const 48
    i32.add
    i32.store offset=20
    local.get 2
    local.get 2
    i32.const 36
    i32.add
    i32.store offset=48
    local.get 2
    i32.const 12
    i32.add
    i32.const 1052788
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $__rdl_alloc (;133;) (type 4) (param i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.le_u
        br_if 1 (;@1;)
      end
      local.get 1
      local.get 1
      local.get 0
      local.get 1
      i32.rem_u
      local.tee 2
      i32.sub
      i32.const 0
      local.get 2
      select
      local.get 0
      i32.add
      call $aligned_alloc
      return
    end
    local.get 0
    call $malloc
  )
  (func $__rdl_dealloc (;134;) (type 6) (param i32 i32 i32)
    local.get 0
    call $free
  )
  (func $__rdl_realloc (;135;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 8
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.le_u
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 4
        local.get 2
        local.get 2
        local.get 3
        local.get 2
        i32.rem_u
        local.tee 5
        i32.sub
        i32.const 0
        local.get 5
        select
        local.get 3
        i32.add
        call $aligned_alloc
        local.tee 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        local.get 1
        local.get 3
        i32.lt_u
        select
        call $memcpy
        local.set 2
        local.get 0
        call $free
        local.get 2
        return
      end
      local.get 0
      local.get 3
      call $realloc
      local.set 4
    end
    local.get 4
  )
  (func $__rdl_alloc_zeroed (;136;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.le_u
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 2
      block ;; label = @2
        local.get 1
        local.get 1
        local.get 0
        local.get 1
        i32.rem_u
        local.tee 3
        i32.sub
        i32.const 0
        local.get 3
        select
        local.get 0
        i32.add
        call $aligned_alloc
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        local.get 0
        call $memset
        local.set 2
      end
      local.get 2
      return
    end
    local.get 0
    i32.const 1
    call $calloc
  )
  (func $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h7f70e4630e295081E (;137;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 56
    i32.add
    i32.const 11
    i32.store
    local.get 3
    i32.const 48
    i32.add
    i32.const 14
    i32.store
    local.get 3
    i32.const 1052880
    i32.store offset=4
    local.get 3
    i64.const 3
    i64.store offset=16 align=4
    local.get 3
    i32.const 11
    i32.store offset=40
    local.get 3
    local.get 0
    i32.load offset=8
    i32.store offset=52
    local.get 3
    local.get 0
    i32.load offset=4
    i32.store offset=44
    local.get 3
    local.get 0
    i32.load
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 36
    i32.add
    i32.store offset=12
    local.get 3
    i32.const 4
    i32.store offset=8
    local.get 3
    i32.const 28
    i32.add
    local.get 1
    local.get 3
    i32.const 4
    i32.add
    local.get 2
    call_indirect (type 6)
    local.get 3
    i32.load offset=32
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.load8_u offset=28
        local.tee 5
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 4
      i32.load
      local.tee 6
      local.get 4
      i32.const 4
      i32.add
      i32.load
      local.tee 5
      i32.load
      call_indirect (type 1)
      block ;; label = @2
        local.get 5
        i32.load offset=4
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 7
        local.get 5
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 4
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load offset=12
                i32.load8_u
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 0 (;@6;)
              end
              i32.const 0
              i32.load8_u offset=1057285
              local.set 0
              i32.const 0
              i32.const 1
              i32.store8 offset=1057285
              local.get 3
              local.get 0
              i32.store8 offset=4
              local.get 0
              br_if 3 (;@2;)
              local.get 3
              i32.const 1
              i32.store offset=40
              local.get 3
              i32.const 1050964
              i32.store offset=36
              local.get 3
              i64.const 1
              i64.store offset=48 align=4
              local.get 3
              i32.const 15
              i32.store offset=8
              local.get 3
              i32.const 0
              i32.store8 offset=63
              local.get 3
              local.get 3
              i32.const 4
              i32.add
              i32.store offset=44
              local.get 3
              local.get 3
              i32.const 63
              i32.add
              i32.store offset=4
              local.get 3
              i32.const 28
              i32.add
              local.get 1
              local.get 3
              i32.const 36
              i32.add
              local.get 2
              call_indirect (type 6)
              i32.const 0
              i32.const 0
              i32.store8 offset=1057285
              local.get 3
              i32.load offset=32
              local.set 1
              block ;; label = @6
                local.get 3
                i32.load8_u offset=28
                local.tee 0
                i32.const 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 0
                i32.const 3
                i32.ne
                br_if 3 (;@3;)
              end
              local.get 1
              i32.load
              local.tee 2
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 0
              i32.load
              call_indirect (type 1)
              block ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 5
                local.get 0
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 1
              i32.const 12
              i32.const 4
              call $__rust_dealloc
              br 2 (;@3;)
            end
            i32.const 0
            i32.load8_u offset=1057285
            local.set 0
            i32.const 0
            i32.const 1
            i32.store8 offset=1057285
            local.get 3
            local.get 0
            i32.store8 offset=4
            local.get 0
            br_if 3 (;@1;)
            local.get 3
            i32.const 1
            i32.store offset=40
            local.get 3
            i32.const 1050964
            i32.store offset=36
            local.get 3
            i64.const 1
            i64.store offset=48 align=4
            local.get 3
            i32.const 15
            i32.store offset=8
            local.get 3
            i32.const 1
            i32.store8 offset=63
            local.get 3
            local.get 3
            i32.const 4
            i32.add
            i32.store offset=44
            local.get 3
            local.get 3
            i32.const 63
            i32.add
            i32.store offset=4
            local.get 3
            i32.const 28
            i32.add
            local.get 1
            local.get 3
            i32.const 36
            i32.add
            local.get 2
            call_indirect (type 6)
            i32.const 0
            i32.const 0
            i32.store8 offset=1057285
            local.get 3
            i32.load offset=32
            local.set 1
            block ;; label = @5
              local.get 3
              i32.load8_u offset=28
              local.tee 0
              i32.const 4
              i32.gt_u
              br_if 0 (;@5;)
              local.get 0
              i32.const 3
              i32.ne
              br_if 2 (;@3;)
            end
            local.get 1
            i32.load
            local.tee 2
            local.get 1
            i32.const 4
            i32.add
            i32.load
            local.tee 0
            i32.load
            call_indirect (type 1)
            block ;; label = @5
              local.get 0
              i32.load offset=4
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 5
              local.get 0
              i32.load offset=8
              call $__rust_dealloc
            end
            local.get 1
            i32.const 12
            i32.const 4
            call $__rust_dealloc
            br 1 (;@3;)
          end
          i32.const 0
          i32.load8_u offset=1057224
          local.set 0
          i32.const 0
          i32.const 0
          i32.store8 offset=1057224
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 1
          i32.store offset=40
          local.get 3
          i32.const 1052992
          i32.store offset=36
          local.get 3
          i64.const 0
          i64.store offset=48 align=4
          local.get 3
          i32.const 1050112
          i32.store offset=44
          local.get 3
          i32.const 4
          i32.add
          local.get 1
          local.get 3
          i32.const 36
          i32.add
          local.get 2
          call_indirect (type 6)
          local.get 3
          i32.load offset=8
          local.set 1
          block ;; label = @4
            local.get 3
            i32.load8_u offset=4
            local.tee 0
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 1
          i32.load
          local.tee 2
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 0
          i32.load
          call_indirect (type 1)
          block ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 5
            local.get 0
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 3
        i32.const 64
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 3
      i64.const 0
      i64.store offset=48 align=4
      local.get 3
      i32.const 1050112
      i32.store offset=44
      local.get 3
      i32.const 1
      i32.store offset=40
      local.get 3
      i32.const 1052148
      i32.store offset=36
      local.get 3
      i32.const 4
      i32.add
      local.get 3
      i32.const 36
      i32.add
      call $_ZN4core9panicking13assert_failed17h65fcdd92f642d8f0E
      unreachable
    end
    local.get 3
    i64.const 0
    i64.store offset=48 align=4
    local.get 3
    i32.const 1050112
    i32.store offset=44
    local.get 3
    i32.const 1
    i32.store offset=40
    local.get 3
    i32.const 1052148
    i32.store offset=36
    local.get 3
    i32.const 4
    i32.add
    local.get 3
    i32.const 36
    i32.add
    call $_ZN4core9panicking13assert_failed17h65fcdd92f642d8f0E
    unreachable
  )
  (func $rust_begin_unwind (;138;) (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 2
      br_if 0 (;@1;)
      i32.const 1053000
      call $_ZN4core6option13unwrap_failed17h5cf22e6c8f50e086E
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=12
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.add
    call $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17h5691573a73161cb1E
    unreachable
  )
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17haafd4c195e8cf7f1E (;139;) (type 2) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 36
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=36 align=4
      local.get 2
      i32.const 36
      i32.add
      i32.const 1050584
      local.get 3
      call $_ZN4core3fmt5write17h5aa565b06adfe6beE
      drop
      local.get 2
      i32.const 24
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=36 align=4
      local.tee 5
      i64.store offset=24
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 1
    i64.load align=4
    local.set 5
    local.get 1
    i64.const 4294967296
    i64.store align=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    local.tee 1
    i32.load
    i32.store
    local.get 1
    i32.const 0
    i32.store
    i32.const 0
    i32.load8_u offset=1057245
    drop
    local.get 2
    local.get 5
    i64.store offset=8
    block ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 3
    i32.load
    i32.store
    local.get 0
    i32.const 1053016
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h998c083b631e1261E (;140;) (type 2) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 20
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=20 align=4
      local.get 2
      i32.const 20
      i32.add
      i32.const 1050584
      local.get 3
      call $_ZN4core3fmt5write17h5aa565b06adfe6beE
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=20 align=4
      local.tee 5
      i64.store offset=8
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 0
    i32.const 1053016
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h900ee2d39eee4b2aE (;141;) (type 2) (param i32 i32)
    (local i32 i32)
    i32.const 0
    i32.load8_u offset=1057245
    drop
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    block ;; label = @1
      i32.const 8
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1053032
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
  )
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17hc4aeff84f978920fE (;142;) (type 2) (param i32 i32)
    local.get 0
    i32.const 1053032
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
  )
  (func $_ZN3std9panicking20rust_panic_with_hook17hd3fb69bc0aea298aE (;143;) (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1057304
    local.tee 7
    i32.const 1
    i32.add
    i32.store offset=1057304
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 7
                  i32.const 0
                  i32.lt_s
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load8_u offset=1057324
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.const 1
                  i32.store8 offset=1057324
                  i32.const 0
                  i32.const 0
                  i32.load offset=1057320
                  i32.const 1
                  i32.add
                  i32.store offset=1057320
                  local.get 6
                  local.get 5
                  i32.store8 offset=41
                  local.get 6
                  local.get 4
                  i32.store8 offset=40
                  local.get 6
                  local.get 3
                  i32.store offset=36
                  local.get 6
                  local.get 2
                  i32.store offset=32
                  i32.const 0
                  i32.load offset=1057292
                  local.tee 7
                  i32.const -1
                  i32.le_s
                  br_if 5 (;@2;)
                  i32.const 0
                  local.get 7
                  i32.const 1
                  i32.add
                  i32.store offset=1057292
                  i32.const 0
                  i32.load offset=1057296
                  local.set 7
                  local.get 6
                  i32.const 8
                  i32.add
                  local.get 0
                  local.get 1
                  i32.load offset=16
                  call_indirect (type 2)
                  local.get 6
                  local.get 6
                  i64.load offset=8
                  i64.store offset=24 align=4
                  local.get 7
                  i32.eqz
                  br_if 3 (;@4;)
                  i32.const 0
                  i32.load offset=1057296
                  local.get 6
                  i32.const 24
                  i32.add
                  i32.const 0
                  i32.load offset=1057300
                  i32.load offset=20
                  call_indirect (type 2)
                  br 4 (;@3;)
                end
                local.get 6
                local.get 5
                i32.store8 offset=41
                local.get 6
                local.get 4
                i32.store8 offset=40
                local.get 6
                local.get 3
                i32.store offset=36
                local.get 6
                local.get 2
                i32.store offset=32
                local.get 6
                i32.const 1053088
                i32.store offset=28
                local.get 6
                i32.const 1050112
                i32.store offset=24
                local.get 6
                i32.const 2
                i32.store offset=48
                local.get 6
                i32.const 1053156
                i32.store offset=44
                local.get 6
                i64.const 1
                i64.store offset=56 align=4
                local.get 6
                i32.const 16
                i32.store offset=20
                local.get 6
                local.get 6
                i32.const 16
                i32.add
                i32.store offset=52
                local.get 6
                local.get 6
                i32.const 24
                i32.add
                i32.store offset=16
                local.get 6
                i32.const 4
                i32.store8 offset=68
                local.get 6
                local.get 6
                i32.const 16
                i32.add
                i32.store offset=76
                local.get 6
                i32.const 68
                i32.add
                i32.const 1050560
                local.get 6
                i32.const 44
                i32.add
                call $_ZN4core3fmt5write17h5aa565b06adfe6beE
                local.set 4
                local.get 6
                i32.load8_u offset=68
                local.set 7
                block ;; label = @7
                  local.get 4
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 4
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 6
                  i32.load offset=72
                  local.set 7
                  block ;; label = @8
                    local.get 6
                    i32.load8_u offset=68
                    local.tee 6
                    i32.const 4
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 3
                    i32.ne
                    br_if 3 (;@5;)
                  end
                  local.get 7
                  i32.load
                  local.tee 4
                  local.get 7
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 6
                  i32.load
                  call_indirect (type 1)
                  block ;; label = @8
                    local.get 6
                    i32.load offset=4
                    local.tee 5
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 5
                    local.get 6
                    i32.load offset=8
                    call $__rust_dealloc
                  end
                  local.get 7
                  i32.const 12
                  i32.const 4
                  call $__rust_dealloc
                  call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
                  unreachable
                end
                local.get 6
                i32.load offset=72
                local.set 6
                block ;; label = @7
                  local.get 7
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 3
                  i32.ne
                  br_if 2 (;@5;)
                end
                local.get 6
                i32.load
                local.tee 4
                local.get 6
                i32.const 4
                i32.add
                i32.load
                local.tee 7
                i32.load
                call_indirect (type 1)
                block ;; label = @7
                  local.get 7
                  i32.load offset=4
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 5
                  local.get 7
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 6
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
                unreachable
              end
              local.get 6
              i32.const 1
              i32.store offset=48
              local.get 6
              i32.const 1053224
              i32.store offset=44
              local.get 6
              i64.const 0
              i64.store offset=56 align=4
              local.get 6
              i32.const 1050112
              i32.store offset=52
              local.get 6
              i32.const 4
              i32.store8 offset=24
              local.get 6
              local.get 6
              i32.const 16
              i32.add
              i32.store offset=32
              local.get 6
              i32.const 24
              i32.add
              i32.const 1050560
              local.get 6
              i32.const 44
              i32.add
              call $_ZN4core3fmt5write17h5aa565b06adfe6beE
              local.set 4
              local.get 6
              i32.load8_u offset=24
              local.set 7
              block ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                i32.const 4
                i32.eq
                br_if 1 (;@5;)
                local.get 6
                i32.load offset=28
                local.set 7
                block ;; label = @7
                  local.get 6
                  i32.load8_u offset=24
                  local.tee 6
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 3
                  i32.ne
                  br_if 2 (;@5;)
                end
                local.get 7
                i32.load
                local.tee 4
                local.get 7
                i32.const 4
                i32.add
                i32.load
                local.tee 6
                i32.load
                call_indirect (type 1)
                block ;; label = @7
                  local.get 6
                  i32.load offset=4
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 5
                  local.get 6
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 7
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
                unreachable
              end
              local.get 6
              i32.load offset=28
              local.set 6
              block ;; label = @6
                local.get 7
                i32.const 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 7
                i32.const 3
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 6
              i32.load
              local.tee 4
              local.get 6
              i32.const 4
              i32.add
              i32.load
              local.tee 7
              i32.load
              call_indirect (type 1)
              block ;; label = @6
                local.get 7
                i32.load offset=4
                local.tee 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 5
                local.get 7
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 6
              i32.const 12
              i32.const 4
              call $__rust_dealloc
            end
            call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
            unreachable
          end
          local.get 6
          i32.const 24
          i32.add
          call $_ZN3std9panicking12default_hook17h833f8a94facaf05fE
        end
        i32.const 0
        i32.const 0
        i32.load offset=1057292
        i32.const -1
        i32.add
        i32.store offset=1057292
        i32.const 0
        i32.const 0
        i32.store8 offset=1057324
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        call $rust_panic
        unreachable
      end
      local.get 6
      i32.const 1
      i32.store offset=48
      local.get 6
      i32.const 1053636
      i32.store offset=44
      local.get 6
      i64.const 0
      i64.store offset=56 align=4
      local.get 6
      local.get 6
      i32.const 16
      i32.add
      i32.store offset=52
      local.get 6
      i32.const 68
      i32.add
      local.get 6
      i32.const 16
      i32.add
      local.get 6
      i32.const 44
      i32.add
      call $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E
      local.get 6
      i32.load8_u offset=68
      local.get 6
      i32.load offset=72
      call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb702cd6d0aaa2266E
      call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
      unreachable
    end
    local.get 6
    i32.const 1
    i32.store offset=48
    local.get 6
    i32.const 1053280
    i32.store offset=44
    local.get 6
    i64.const 0
    i64.store offset=56 align=4
    local.get 6
    i32.const 1050112
    i32.store offset=52
    local.get 6
    i32.const 68
    i32.add
    local.get 6
    i32.const 16
    i32.add
    local.get 6
    i32.const 44
    i32.add
    call $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E
    local.get 6
    i32.load8_u offset=68
    local.get 6
    i32.load offset=72
    call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb702cd6d0aaa2266E
    call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
    unreachable
  )
  (func $rust_panic (;144;) (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    local.get 1
    call $__rust_start_panic
    i32.store
    local.get 2
    i32.const 2
    i32.store offset=16
    local.get 2
    i32.const 1053344
    i32.store offset=12
    local.get 2
    i64.const 1
    i64.store offset=24 align=4
    local.get 2
    i32.const 13
    i32.store offset=40
    local.get 2
    local.get 2
    i32.const 36
    i32.add
    i32.store offset=20
    local.get 2
    local.get 2
    i32.store offset=36
    local.get 2
    i32.const 4
    i32.add
    local.get 2
    i32.const 47
    i32.add
    local.get 2
    i32.const 12
    i32.add
    call $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E
    local.get 2
    i32.load8_u offset=4
    local.get 2
    i32.load offset=8
    call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb702cd6d0aaa2266E
    call $_ZN3std3sys3pal4wasi7helpers14abort_internal17h05344e3339eea616E
    unreachable
  )
  (func $_ZN3std5alloc8rust_oom17h45e9f16c5b8cc468E (;145;) (type 2) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    i32.const 0
    i32.load offset=1057288
    local.tee 2
    i32.const 17
    local.get 2
    select
    call_indirect (type 2)
    call $_ZN3std7process5abort17haa0f109eaf5171f4E
    unreachable
  )
  (func $__rg_oom (;146;) (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $_ZN3std5alloc8rust_oom17h45e9f16c5b8cc468E
    unreachable
  )
  (func $__rust_start_panic (;147;) (type 4) (param i32 i32) (result i32)
    unreachable
    unreachable
  )
  (func $_ZN4wasi13lib_generated8fd_write17h25bc46f655db4212E (;148;) (type 11) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        local.get 2
        local.get 3
        local.get 4
        i32.const 12
        i32.add
        call $_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17h99c3efa82f72b951E
        local.tee 3
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i32.store16 offset=2
      i32.const 1
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store16
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $malloc (;149;) (type 3) (param i32) (result i32)
    local.get 0
    call $dlmalloc
  )
  (func $dlmalloc (;150;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1057368
                            local.tee 2
                            br_if 0 (;@12;)
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1057816
                              local.tee 3
                              br_if 0 (;@13;)
                              i32.const 0
                              i64.const -1
                              i64.store offset=1057828 align=4
                              i32.const 0
                              i64.const 281474976776192
                              i64.store offset=1057820 align=4
                              i32.const 0
                              local.get 1
                              i32.const 8
                              i32.add
                              i32.const -16
                              i32.and
                              i32.const 1431655768
                              i32.xor
                              local.tee 3
                              i32.store offset=1057816
                              i32.const 0
                              i32.const 0
                              i32.store offset=1057836
                              i32.const 0
                              i32.const 0
                              i32.store offset=1057788
                            end
                            i32.const 1114112
                            i32.const 1057888
                            i32.lt_u
                            br_if 1 (;@11;)
                            i32.const 0
                            local.set 2
                            i32.const 1114112
                            i32.const 1057888
                            i32.sub
                            i32.const 89
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 4
                            i32.const 0
                            i32.const 1057888
                            i32.store offset=1057792
                            i32.const 0
                            i32.const 1057888
                            i32.store offset=1057360
                            i32.const 0
                            local.get 3
                            i32.store offset=1057380
                            i32.const 0
                            i32.const -1
                            i32.store offset=1057376
                            i32.const 0
                            i32.const 1114112
                            i32.const 1057888
                            i32.sub
                            i32.store offset=1057796
                            loop ;; label = @13
                              local.get 4
                              i32.const 1057404
                              i32.add
                              local.get 4
                              i32.const 1057392
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 4
                              i32.const 1057384
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 4
                              i32.const 1057396
                              i32.add
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 1057412
                              i32.add
                              local.get 4
                              i32.const 1057400
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 5
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 1057420
                              i32.add
                              local.get 4
                              i32.const 1057408
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 1057416
                              i32.add
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 32
                              i32.add
                              local.tee 4
                              i32.const 256
                              i32.ne
                              br_if 0 (;@13;)
                            end
                            i32.const 1057888
                            i32.const -8
                            i32.const 1057888
                            i32.sub
                            i32.const 15
                            i32.and
                            i32.const 0
                            i32.const 1057888
                            i32.const 8
                            i32.add
                            i32.const 15
                            i32.and
                            select
                            local.tee 4
                            i32.add
                            local.tee 2
                            i32.const 4
                            i32.add
                            i32.const 1114112
                            i32.const 1057888
                            i32.sub
                            i32.const -56
                            i32.add
                            local.tee 3
                            local.get 4
                            i32.sub
                            local.tee 4
                            i32.const 1
                            i32.or
                            i32.store
                            i32.const 0
                            i32.const 0
                            i32.load offset=1057832
                            i32.store offset=1057372
                            i32.const 0
                            local.get 4
                            i32.store offset=1057356
                            i32.const 0
                            local.get 2
                            i32.store offset=1057368
                            local.get 3
                            i32.const 1057888
                            i32.add
                            i32.const 4
                            i32.add
                            i32.const 56
                            i32.store
                          end
                          block ;; label = @12
                            block ;; label = @13
                              local.get 0
                              i32.const 236
                              i32.gt_u
                              br_if 0 (;@13;)
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1057344
                                local.tee 6
                                i32.const 16
                                local.get 0
                                i32.const 19
                                i32.add
                                i32.const -16
                                i32.and
                                local.get 0
                                i32.const 11
                                i32.lt_u
                                select
                                local.tee 7
                                i32.const 3
                                i32.shr_u
                                local.tee 3
                                i32.shr_u
                                local.tee 4
                                i32.const 3
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 4
                                    i32.const 1
                                    i32.and
                                    local.get 3
                                    i32.or
                                    i32.const 1
                                    i32.xor
                                    local.tee 5
                                    i32.const 3
                                    i32.shl
                                    local.tee 3
                                    i32.const 1057384
                                    i32.add
                                    local.tee 4
                                    local.get 3
                                    i32.const 1057392
                                    i32.add
                                    i32.load
                                    local.tee 3
                                    i32.load offset=8
                                    local.tee 7
                                    i32.ne
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    i32.const -2
                                    local.get 5
                                    i32.rotl
                                    i32.and
                                    i32.store offset=1057344
                                    br 1 (;@15;)
                                  end
                                  local.get 4
                                  local.get 7
                                  i32.store offset=8
                                  local.get 7
                                  local.get 4
                                  i32.store offset=12
                                end
                                local.get 3
                                i32.const 8
                                i32.add
                                local.set 4
                                local.get 3
                                local.get 5
                                i32.const 3
                                i32.shl
                                local.tee 5
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 3
                                local.get 5
                                i32.add
                                local.tee 3
                                local.get 3
                                i32.load offset=4
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                br 13 (;@1;)
                              end
                              local.get 7
                              i32.const 0
                              i32.load offset=1057352
                              local.tee 8
                              i32.le_u
                              br_if 1 (;@12;)
                              block ;; label = @14
                                local.get 4
                                i32.eqz
                                br_if 0 (;@14;)
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 4
                                    local.get 3
                                    i32.shl
                                    i32.const 2
                                    local.get 3
                                    i32.shl
                                    local.tee 4
                                    i32.const 0
                                    local.get 4
                                    i32.sub
                                    i32.or
                                    i32.and
                                    local.tee 4
                                    i32.const 0
                                    local.get 4
                                    i32.sub
                                    i32.and
                                    i32.ctz
                                    local.tee 3
                                    i32.const 3
                                    i32.shl
                                    local.tee 4
                                    i32.const 1057384
                                    i32.add
                                    local.tee 5
                                    local.get 4
                                    i32.const 1057392
                                    i32.add
                                    i32.load
                                    local.tee 4
                                    i32.load offset=8
                                    local.tee 0
                                    i32.ne
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    i32.const -2
                                    local.get 3
                                    i32.rotl
                                    i32.and
                                    local.tee 6
                                    i32.store offset=1057344
                                    br 1 (;@15;)
                                  end
                                  local.get 5
                                  local.get 0
                                  i32.store offset=8
                                  local.get 0
                                  local.get 5
                                  i32.store offset=12
                                end
                                local.get 4
                                local.get 7
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 4
                                local.get 3
                                i32.const 3
                                i32.shl
                                local.tee 3
                                i32.add
                                local.get 3
                                local.get 7
                                i32.sub
                                local.tee 5
                                i32.store
                                local.get 4
                                local.get 7
                                i32.add
                                local.tee 0
                                local.get 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                block ;; label = @15
                                  local.get 8
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.const -8
                                  i32.and
                                  i32.const 1057384
                                  i32.add
                                  local.set 7
                                  i32.const 0
                                  i32.load offset=1057364
                                  local.set 3
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 6
                                      i32.const 1
                                      local.get 8
                                      i32.const 3
                                      i32.shr_u
                                      i32.shl
                                      local.tee 9
                                      i32.and
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.get 6
                                      local.get 9
                                      i32.or
                                      i32.store offset=1057344
                                      local.get 7
                                      local.set 9
                                      br 1 (;@16;)
                                    end
                                    local.get 7
                                    i32.load offset=8
                                    local.set 9
                                  end
                                  local.get 9
                                  local.get 3
                                  i32.store offset=12
                                  local.get 7
                                  local.get 3
                                  i32.store offset=8
                                  local.get 3
                                  local.get 7
                                  i32.store offset=12
                                  local.get 3
                                  local.get 9
                                  i32.store offset=8
                                end
                                local.get 4
                                i32.const 8
                                i32.add
                                local.set 4
                                i32.const 0
                                local.get 0
                                i32.store offset=1057364
                                i32.const 0
                                local.get 5
                                i32.store offset=1057352
                                br 13 (;@1;)
                              end
                              i32.const 0
                              i32.load offset=1057348
                              local.tee 10
                              i32.eqz
                              br_if 1 (;@12;)
                              local.get 10
                              i32.const 0
                              local.get 10
                              i32.sub
                              i32.and
                              i32.ctz
                              i32.const 2
                              i32.shl
                              i32.const 1057648
                              i32.add
                              i32.load
                              local.tee 0
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 7
                              i32.sub
                              local.set 3
                              local.get 0
                              local.set 5
                              block ;; label = @14
                                loop ;; label = @15
                                  block ;; label = @16
                                    local.get 5
                                    i32.load offset=16
                                    local.tee 4
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 20
                                    i32.add
                                    i32.load
                                    local.tee 4
                                    i32.eqz
                                    br_if 2 (;@14;)
                                  end
                                  local.get 4
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 7
                                  i32.sub
                                  local.tee 5
                                  local.get 3
                                  local.get 5
                                  local.get 3
                                  i32.lt_u
                                  local.tee 5
                                  select
                                  local.set 3
                                  local.get 4
                                  local.get 0
                                  local.get 5
                                  select
                                  local.set 0
                                  local.get 4
                                  local.set 5
                                  br 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load offset=24
                              local.set 11
                              block ;; label = @14
                                local.get 0
                                i32.load offset=12
                                local.tee 9
                                local.get 0
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=8
                                local.tee 4
                                i32.const 0
                                i32.load offset=1057360
                                i32.lt_u
                                drop
                                local.get 9
                                local.get 4
                                i32.store offset=8
                                local.get 4
                                local.get 9
                                i32.store offset=12
                                br 12 (;@2;)
                              end
                              block ;; label = @14
                                local.get 0
                                i32.const 20
                                i32.add
                                local.tee 5
                                i32.load
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=16
                                local.tee 4
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 0
                                i32.const 16
                                i32.add
                                local.set 5
                              end
                              loop ;; label = @14
                                local.get 5
                                local.set 2
                                local.get 4
                                local.tee 9
                                i32.const 20
                                i32.add
                                local.tee 5
                                i32.load
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 9
                                i32.const 16
                                i32.add
                                local.set 5
                                local.get 9
                                i32.load offset=16
                                local.tee 4
                                br_if 0 (;@14;)
                              end
                              local.get 2
                              i32.const 0
                              i32.store
                              br 11 (;@2;)
                            end
                            i32.const -1
                            local.set 7
                            local.get 0
                            i32.const -65
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 19
                            i32.add
                            local.tee 4
                            i32.const -16
                            i32.and
                            local.set 7
                            i32.const 0
                            i32.load offset=1057348
                            local.tee 10
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 8
                            block ;; label = @13
                              local.get 7
                              i32.const 256
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 31
                              local.set 8
                              local.get 7
                              i32.const 16777215
                              i32.gt_u
                              br_if 0 (;@13;)
                              local.get 7
                              i32.const 38
                              local.get 4
                              i32.const 8
                              i32.shr_u
                              i32.clz
                              local.tee 4
                              i32.sub
                              i32.shr_u
                              i32.const 1
                              i32.and
                              local.get 4
                              i32.const 1
                              i32.shl
                              i32.sub
                              i32.const 62
                              i32.add
                              local.set 8
                            end
                            i32.const 0
                            local.get 7
                            i32.sub
                            local.set 3
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 8
                                    i32.const 2
                                    i32.shl
                                    i32.const 1057648
                                    i32.add
                                    i32.load
                                    local.tee 5
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 4
                                    i32.const 0
                                    local.set 9
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.set 4
                                  local.get 7
                                  i32.const 0
                                  i32.const 25
                                  local.get 8
                                  i32.const 1
                                  i32.shr_u
                                  i32.sub
                                  local.get 8
                                  i32.const 31
                                  i32.eq
                                  select
                                  i32.shl
                                  local.set 0
                                  i32.const 0
                                  local.set 9
                                  loop ;; label = @16
                                    block ;; label = @17
                                      local.get 5
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 7
                                      i32.sub
                                      local.tee 6
                                      local.get 3
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 6
                                      local.set 3
                                      local.get 5
                                      local.set 9
                                      local.get 6
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 3
                                      local.get 5
                                      local.set 9
                                      local.get 5
                                      local.set 4
                                      br 3 (;@14;)
                                    end
                                    local.get 4
                                    local.get 5
                                    i32.const 20
                                    i32.add
                                    i32.load
                                    local.tee 6
                                    local.get 6
                                    local.get 5
                                    local.get 0
                                    i32.const 29
                                    i32.shr_u
                                    i32.const 4
                                    i32.and
                                    i32.add
                                    i32.const 16
                                    i32.add
                                    i32.load
                                    local.tee 5
                                    i32.eq
                                    select
                                    local.get 4
                                    local.get 6
                                    select
                                    local.set 4
                                    local.get 0
                                    i32.const 1
                                    i32.shl
                                    local.set 0
                                    local.get 5
                                    br_if 0 (;@16;)
                                  end
                                end
                                block ;; label = @15
                                  local.get 4
                                  local.get 9
                                  i32.or
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 9
                                  i32.const 2
                                  local.get 8
                                  i32.shl
                                  local.tee 4
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.or
                                  local.get 10
                                  i32.and
                                  local.tee 4
                                  i32.eqz
                                  br_if 3 (;@12;)
                                  local.get 4
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.and
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.const 1057648
                                  i32.add
                                  i32.load
                                  local.set 4
                                end
                                local.get 4
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              loop ;; label = @14
                                local.get 4
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 7
                                i32.sub
                                local.tee 6
                                local.get 3
                                i32.lt_u
                                local.set 0
                                block ;; label = @15
                                  local.get 4
                                  i32.load offset=16
                                  local.tee 5
                                  br_if 0 (;@15;)
                                  local.get 4
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.set 5
                                end
                                local.get 6
                                local.get 3
                                local.get 0
                                select
                                local.set 3
                                local.get 4
                                local.get 9
                                local.get 0
                                select
                                local.set 9
                                local.get 5
                                local.set 4
                                local.get 5
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 9
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 0
                            i32.load offset=1057352
                            local.get 7
                            i32.sub
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 9
                            i32.load offset=24
                            local.set 2
                            block ;; label = @13
                              local.get 9
                              i32.load offset=12
                              local.tee 0
                              local.get 9
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=8
                              local.tee 4
                              i32.const 0
                              i32.load offset=1057360
                              i32.lt_u
                              drop
                              local.get 0
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              local.get 0
                              i32.store offset=12
                              br 10 (;@3;)
                            end
                            block ;; label = @13
                              local.get 9
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=16
                              local.tee 4
                              i32.eqz
                              br_if 4 (;@9;)
                              local.get 9
                              i32.const 16
                              i32.add
                              local.set 5
                            end
                            loop ;; label = @13
                              local.get 5
                              local.set 6
                              local.get 4
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 5
                              local.get 0
                              i32.load offset=16
                              local.tee 4
                              br_if 0 (;@13;)
                            end
                            local.get 6
                            i32.const 0
                            i32.store
                            br 9 (;@3;)
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1057352
                            local.tee 4
                            local.get 7
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=1057364
                            local.set 3
                            block ;; label = @13
                              block ;; label = @14
                                local.get 4
                                local.get 7
                                i32.sub
                                local.tee 5
                                i32.const 16
                                i32.lt_u
                                br_if 0 (;@14;)
                                local.get 3
                                local.get 7
                                i32.add
                                local.tee 0
                                local.get 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 3
                                local.get 4
                                i32.add
                                local.get 5
                                i32.store
                                local.get 3
                                local.get 7
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                br 1 (;@13;)
                              end
                              local.get 3
                              local.get 4
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 3
                              local.get 4
                              i32.add
                              local.tee 4
                              local.get 4
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.set 0
                              i32.const 0
                              local.set 5
                            end
                            i32.const 0
                            local.get 5
                            i32.store offset=1057352
                            i32.const 0
                            local.get 0
                            i32.store offset=1057364
                            local.get 3
                            i32.const 8
                            i32.add
                            local.set 4
                            br 11 (;@1;)
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1057356
                            local.tee 5
                            local.get 7
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 2
                            local.get 7
                            i32.add
                            local.tee 4
                            local.get 5
                            local.get 7
                            i32.sub
                            local.tee 3
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            local.get 4
                            i32.store offset=1057368
                            i32.const 0
                            local.get 3
                            i32.store offset=1057356
                            local.get 2
                            local.get 7
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 2
                            i32.const 8
                            i32.add
                            local.set 4
                            br 11 (;@1;)
                          end
                          block ;; label = @12
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1057816
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=1057824
                              local.set 3
                              br 1 (;@12;)
                            end
                            i32.const 0
                            i64.const -1
                            i64.store offset=1057828 align=4
                            i32.const 0
                            i64.const 281474976776192
                            i64.store offset=1057820 align=4
                            i32.const 0
                            local.get 1
                            i32.const 12
                            i32.add
                            i32.const -16
                            i32.and
                            i32.const 1431655768
                            i32.xor
                            i32.store offset=1057816
                            i32.const 0
                            i32.const 0
                            i32.store offset=1057836
                            i32.const 0
                            i32.const 0
                            i32.store offset=1057788
                            i32.const 65536
                            local.set 3
                          end
                          i32.const 0
                          local.set 4
                          block ;; label = @12
                            local.get 3
                            local.get 7
                            i32.const 71
                            i32.add
                            local.tee 8
                            i32.add
                            local.tee 0
                            i32.const 0
                            local.get 3
                            i32.sub
                            local.tee 6
                            i32.and
                            local.tee 9
                            local.get 7
                            i32.gt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.const 48
                            i32.store offset=1057840
                            br 11 (;@1;)
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1057784
                            local.tee 4
                            i32.eqz
                            br_if 0 (;@12;)
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1057776
                              local.tee 3
                              local.get 9
                              i32.add
                              local.tee 10
                              local.get 3
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 10
                              local.get 4
                              i32.le_u
                              br_if 1 (;@12;)
                            end
                            i32.const 0
                            local.set 4
                            i32.const 0
                            i32.const 48
                            i32.store offset=1057840
                            br 11 (;@1;)
                          end
                          i32.const 0
                          i32.load8_u offset=1057788
                          i32.const 4
                          i32.and
                          br_if 5 (;@6;)
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                local.get 2
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 1057792
                                local.set 4
                                loop ;; label = @15
                                  block ;; label = @16
                                    local.get 4
                                    i32.load
                                    local.tee 3
                                    local.get 2
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    local.get 3
                                    local.get 4
                                    i32.load offset=4
                                    i32.add
                                    local.get 2
                                    i32.gt_u
                                    br_if 3 (;@13;)
                                  end
                                  local.get 4
                                  i32.load offset=8
                                  local.tee 4
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 0
                              call $sbrk
                              local.tee 0
                              i32.const -1
                              i32.eq
                              br_if 6 (;@7;)
                              local.get 9
                              local.set 6
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1057820
                                local.tee 4
                                i32.const -1
                                i32.add
                                local.tee 3
                                local.get 0
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 9
                                local.get 0
                                i32.sub
                                local.get 3
                                local.get 0
                                i32.add
                                i32.const 0
                                local.get 4
                                i32.sub
                                i32.and
                                i32.add
                                local.set 6
                              end
                              local.get 6
                              local.get 7
                              i32.le_u
                              br_if 6 (;@7;)
                              local.get 6
                              i32.const 2147483646
                              i32.gt_u
                              br_if 6 (;@7;)
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1057784
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load offset=1057776
                                local.tee 3
                                local.get 6
                                i32.add
                                local.tee 5
                                local.get 3
                                i32.le_u
                                br_if 7 (;@7;)
                                local.get 5
                                local.get 4
                                i32.gt_u
                                br_if 7 (;@7;)
                              end
                              local.get 6
                              call $sbrk
                              local.tee 4
                              local.get 0
                              i32.ne
                              br_if 1 (;@12;)
                              br 8 (;@5;)
                            end
                            local.get 0
                            local.get 5
                            i32.sub
                            local.get 6
                            i32.and
                            local.tee 6
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            local.get 6
                            call $sbrk
                            local.tee 0
                            local.get 4
                            i32.load
                            local.get 4
                            i32.load offset=4
                            i32.add
                            i32.eq
                            br_if 4 (;@8;)
                            local.get 0
                            local.set 4
                          end
                          block ;; label = @12
                            local.get 4
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 7
                            i32.const 72
                            i32.add
                            local.get 6
                            i32.le_u
                            br_if 0 (;@12;)
                            block ;; label = @13
                              local.get 8
                              local.get 6
                              i32.sub
                              i32.const 0
                              i32.load offset=1057824
                              local.tee 3
                              i32.add
                              i32.const 0
                              local.get 3
                              i32.sub
                              i32.and
                              local.tee 3
                              i32.const 2147483646
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.set 0
                              br 8 (;@5;)
                            end
                            block ;; label = @13
                              local.get 3
                              call $sbrk
                              i32.const -1
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 6
                              i32.add
                              local.set 6
                              local.get 4
                              local.set 0
                              br 8 (;@5;)
                            end
                            i32.const 0
                            local.get 6
                            i32.sub
                            call $sbrk
                            drop
                            br 5 (;@7;)
                          end
                          local.get 4
                          local.set 0
                          local.get 4
                          i32.const -1
                          i32.ne
                          br_if 6 (;@5;)
                          br 4 (;@7;)
                        end
                        unreachable
                        unreachable
                      end
                      i32.const 0
                      local.set 9
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 0
                    br 5 (;@3;)
                  end
                  local.get 0
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1057788
                i32.const 4
                i32.or
                i32.store offset=1057788
              end
              local.get 9
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 9
              call $sbrk
              local.set 0
              i32.const 0
              call $sbrk
              local.set 4
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 4
              i32.ge_u
              br_if 1 (;@4;)
              local.get 4
              local.get 0
              i32.sub
              local.tee 6
              local.get 7
              i32.const 56
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1057776
            local.get 6
            i32.add
            local.tee 4
            i32.store offset=1057776
            block ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=1057780
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 4
              i32.store offset=1057780
            end
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1057368
                    local.tee 3
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 1057792
                    local.set 4
                    loop ;; label = @9
                      local.get 0
                      local.get 4
                      i32.load
                      local.tee 5
                      local.get 4
                      i32.load offset=4
                      local.tee 9
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 4
                      i32.load offset=8
                      local.tee 4
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block ;; label = @8
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1057360
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 4
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 0
                    i32.store offset=1057360
                  end
                  i32.const 0
                  local.set 4
                  i32.const 0
                  local.get 6
                  i32.store offset=1057796
                  i32.const 0
                  local.get 0
                  i32.store offset=1057792
                  i32.const 0
                  i32.const -1
                  i32.store offset=1057376
                  i32.const 0
                  i32.const 0
                  i32.load offset=1057816
                  i32.store offset=1057380
                  i32.const 0
                  i32.const 0
                  i32.store offset=1057804
                  loop ;; label = @8
                    local.get 4
                    i32.const 1057404
                    i32.add
                    local.get 4
                    i32.const 1057392
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 4
                    i32.const 1057384
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 4
                    i32.const 1057396
                    i32.add
                    local.get 5
                    i32.store
                    local.get 4
                    i32.const 1057412
                    i32.add
                    local.get 4
                    i32.const 1057400
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 1057420
                    i32.add
                    local.get 4
                    i32.const 1057408
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 5
                    i32.store
                    local.get 4
                    i32.const 1057416
                    i32.add
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 32
                    i32.add
                    local.tee 4
                    i32.const 256
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 0
                  i32.const -8
                  local.get 0
                  i32.sub
                  i32.const 15
                  i32.and
                  i32.const 0
                  local.get 0
                  i32.const 8
                  i32.add
                  i32.const 15
                  i32.and
                  select
                  local.tee 4
                  i32.add
                  local.tee 3
                  local.get 6
                  i32.const -56
                  i32.add
                  local.tee 5
                  local.get 4
                  i32.sub
                  local.tee 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1057832
                  i32.store offset=1057372
                  i32.const 0
                  local.get 4
                  i32.store offset=1057356
                  i32.const 0
                  local.get 3
                  i32.store offset=1057368
                  local.get 0
                  local.get 5
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 2 (;@5;)
                end
                local.get 4
                i32.load8_u offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.get 5
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                local.get 0
                i32.ge_u
                br_if 0 (;@6;)
                local.get 3
                i32.const -8
                local.get 3
                i32.sub
                i32.const 15
                i32.and
                i32.const 0
                local.get 3
                i32.const 8
                i32.add
                i32.const 15
                i32.and
                select
                local.tee 5
                i32.add
                local.tee 0
                i32.const 0
                i32.load offset=1057356
                local.get 6
                i32.add
                local.tee 2
                local.get 5
                i32.sub
                local.tee 5
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 9
                local.get 6
                i32.add
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=1057832
                i32.store offset=1057372
                i32.const 0
                local.get 5
                i32.store offset=1057356
                i32.const 0
                local.get 0
                i32.store offset=1057368
                local.get 3
                local.get 2
                i32.add
                i32.const 56
                i32.store offset=4
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 0
                i32.const 0
                i32.load offset=1057360
                local.tee 9
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                i32.store offset=1057360
                local.get 0
                local.set 9
              end
              local.get 0
              local.get 6
              i32.add
              local.set 5
              i32.const 1057792
              local.set 4
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            loop ;; label = @13
                              local.get 4
                              i32.load
                              local.get 5
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 4
                              i32.load offset=8
                              local.tee 4
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 4
                          i32.load8_u offset=12
                          i32.const 8
                          i32.and
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        i32.const 1057792
                        local.set 4
                        loop ;; label = @11
                          block ;; label = @12
                            local.get 4
                            i32.load
                            local.tee 5
                            local.get 3
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 5
                            local.get 4
                            i32.load offset=4
                            i32.add
                            local.tee 5
                            local.get 3
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 4
                          i32.load offset=8
                          local.set 4
                          br 0 (;@11;)
                        end
                      end
                      local.get 4
                      local.get 0
                      i32.store
                      local.get 4
                      local.get 4
                      i32.load offset=4
                      local.get 6
                      i32.add
                      i32.store offset=4
                      local.get 0
                      i32.const -8
                      local.get 0
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 0
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 2
                      local.get 7
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 5
                      i32.const -8
                      local.get 5
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 5
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 6
                      local.get 2
                      local.get 7
                      i32.add
                      local.tee 7
                      i32.sub
                      local.set 4
                      block ;; label = @10
                        local.get 6
                        local.get 3
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 7
                        i32.store offset=1057368
                        i32.const 0
                        i32.const 0
                        i32.load offset=1057356
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=1057356
                        local.get 7
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      block ;; label = @10
                        local.get 6
                        i32.const 0
                        i32.load offset=1057364
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 7
                        i32.store offset=1057364
                        i32.const 0
                        i32.const 0
                        i32.load offset=1057352
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=1057352
                        local.get 7
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 4
                        i32.add
                        local.get 4
                        i32.store
                        br 3 (;@7;)
                      end
                      block ;; label = @10
                        local.get 6
                        i32.load offset=4
                        local.tee 3
                        i32.const 3
                        i32.and
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 3
                        i32.const -8
                        i32.and
                        local.set 8
                        block ;; label = @11
                          block ;; label = @12
                            local.get 3
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=8
                            local.tee 5
                            local.get 3
                            i32.const 3
                            i32.shr_u
                            local.tee 9
                            i32.const 3
                            i32.shl
                            i32.const 1057384
                            i32.add
                            local.tee 0
                            i32.eq
                            drop
                            block ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 3
                              local.get 5
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1057344
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              i32.store offset=1057344
                              br 2 (;@11;)
                            end
                            local.get 3
                            local.get 0
                            i32.eq
                            drop
                            local.get 3
                            local.get 5
                            i32.store offset=8
                            local.get 5
                            local.get 3
                            i32.store offset=12
                            br 1 (;@11;)
                          end
                          local.get 6
                          i32.load offset=24
                          local.set 10
                          block ;; label = @12
                            block ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 0
                              local.get 6
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 6
                              i32.load offset=8
                              local.tee 3
                              local.get 9
                              i32.lt_u
                              drop
                              local.get 0
                              local.get 3
                              i32.store offset=8
                              local.get 3
                              local.get 0
                              i32.store offset=12
                              br 1 (;@12;)
                            end
                            block ;; label = @13
                              local.get 6
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 5
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 16
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 5
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 0
                              br 1 (;@12;)
                            end
                            loop ;; label = @13
                              local.get 3
                              local.set 9
                              local.get 5
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 5
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 3
                              local.get 0
                              i32.load offset=16
                              local.tee 5
                              br_if 0 (;@13;)
                            end
                            local.get 9
                            i32.const 0
                            i32.store
                          end
                          local.get 10
                          i32.eqz
                          br_if 0 (;@11;)
                          block ;; label = @12
                            block ;; label = @13
                              local.get 6
                              local.get 6
                              i32.load offset=28
                              local.tee 5
                              i32.const 2
                              i32.shl
                              i32.const 1057648
                              i32.add
                              local.tee 3
                              i32.load
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 0
                              i32.store
                              local.get 0
                              br_if 1 (;@12;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1057348
                              i32.const -2
                              local.get 5
                              i32.rotl
                              i32.and
                              i32.store offset=1057348
                              br 2 (;@11;)
                            end
                            local.get 10
                            i32.const 16
                            i32.const 20
                            local.get 10
                            i32.load offset=16
                            local.get 6
                            i32.eq
                            select
                            i32.add
                            local.get 0
                            i32.store
                            local.get 0
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          local.get 0
                          local.get 10
                          i32.store offset=24
                          block ;; label = @12
                            local.get 6
                            i32.load offset=16
                            local.tee 3
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 3
                            i32.store offset=16
                            local.get 3
                            local.get 0
                            i32.store offset=24
                          end
                          local.get 6
                          i32.load offset=20
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 20
                          i32.add
                          local.get 3
                          i32.store
                          local.get 3
                          local.get 0
                          i32.store offset=24
                        end
                        local.get 8
                        local.get 4
                        i32.add
                        local.set 4
                        local.get 6
                        local.get 8
                        i32.add
                        local.tee 6
                        i32.load offset=4
                        local.set 3
                      end
                      local.get 6
                      local.get 3
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 7
                      local.get 4
                      i32.add
                      local.get 4
                      i32.store
                      local.get 7
                      local.get 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      block ;; label = @10
                        local.get 4
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const -8
                        i32.and
                        i32.const 1057384
                        i32.add
                        local.set 3
                        block ;; label = @11
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1057344
                            local.tee 5
                            i32.const 1
                            local.get 4
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 5
                            local.get 4
                            i32.or
                            i32.store offset=1057344
                            local.get 3
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 4
                        local.get 7
                        i32.store offset=12
                        local.get 3
                        local.get 7
                        i32.store offset=8
                        local.get 7
                        local.get 3
                        i32.store offset=12
                        local.get 7
                        local.get 4
                        i32.store offset=8
                        br 3 (;@7;)
                      end
                      i32.const 31
                      local.set 3
                      block ;; label = @10
                        local.get 4
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 38
                        local.get 4
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 3
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 3
                        i32.const 1
                        i32.shl
                        i32.sub
                        i32.const 62
                        i32.add
                        local.set 3
                      end
                      local.get 7
                      local.get 3
                      i32.store offset=28
                      local.get 7
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 3
                      i32.const 2
                      i32.shl
                      i32.const 1057648
                      i32.add
                      local.set 5
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1057348
                        local.tee 0
                        i32.const 1
                        local.get 3
                        i32.shl
                        local.tee 9
                        i32.and
                        br_if 0 (;@10;)
                        local.get 5
                        local.get 7
                        i32.store
                        i32.const 0
                        local.get 0
                        local.get 9
                        i32.or
                        i32.store offset=1057348
                        local.get 7
                        local.get 5
                        i32.store offset=24
                        local.get 7
                        local.get 7
                        i32.store offset=8
                        local.get 7
                        local.get 7
                        i32.store offset=12
                        br 3 (;@7;)
                      end
                      local.get 4
                      i32.const 0
                      i32.const 25
                      local.get 3
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 3
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 3
                      local.get 5
                      i32.load
                      local.set 0
                      loop ;; label = @10
                        local.get 0
                        local.tee 5
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 4
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 29
                        i32.shr_u
                        local.set 0
                        local.get 3
                        i32.const 1
                        i32.shl
                        local.set 3
                        local.get 5
                        local.get 0
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 9
                        i32.load
                        local.tee 0
                        br_if 0 (;@10;)
                      end
                      local.get 9
                      local.get 7
                      i32.store
                      local.get 7
                      local.get 5
                      i32.store offset=24
                      local.get 7
                      local.get 7
                      i32.store offset=12
                      local.get 7
                      local.get 7
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    local.get 0
                    i32.const -8
                    local.get 0
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 0
                    i32.const 8
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    local.tee 4
                    i32.add
                    local.tee 2
                    local.get 6
                    i32.const -56
                    i32.add
                    local.tee 9
                    local.get 4
                    i32.sub
                    local.tee 4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 9
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 3
                    local.get 5
                    i32.const 55
                    local.get 5
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 5
                    i32.const -55
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 9
                    local.get 9
                    local.get 3
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 9
                    i32.const 35
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=1057832
                    i32.store offset=1057372
                    i32.const 0
                    local.get 4
                    i32.store offset=1057356
                    i32.const 0
                    local.get 2
                    i32.store offset=1057368
                    local.get 9
                    i32.const 16
                    i32.add
                    i32.const 0
                    i64.load offset=1057800 align=4
                    i64.store align=4
                    local.get 9
                    i32.const 0
                    i64.load offset=1057792 align=4
                    i64.store offset=8 align=4
                    i32.const 0
                    local.get 9
                    i32.const 8
                    i32.add
                    i32.store offset=1057800
                    i32.const 0
                    local.get 6
                    i32.store offset=1057796
                    i32.const 0
                    local.get 0
                    i32.store offset=1057792
                    i32.const 0
                    i32.const 0
                    i32.store offset=1057804
                    local.get 9
                    i32.const 36
                    i32.add
                    local.set 4
                    loop ;; label = @9
                      local.get 4
                      i32.const 7
                      i32.store
                      local.get 4
                      i32.const 4
                      i32.add
                      local.tee 4
                      local.get 5
                      i32.lt_u
                      br_if 0 (;@9;)
                    end
                    local.get 9
                    local.get 3
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 9
                    local.get 9
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 9
                    local.get 9
                    local.get 3
                    i32.sub
                    local.tee 0
                    i32.store
                    local.get 3
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block ;; label = @9
                      local.get 0
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const -8
                      i32.and
                      i32.const 1057384
                      i32.add
                      local.set 4
                      block ;; label = @10
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1057344
                          local.tee 5
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 0
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 5
                          local.get 0
                          i32.or
                          i32.store offset=1057344
                          local.get 4
                          local.set 5
                          br 1 (;@10;)
                        end
                        local.get 4
                        i32.load offset=8
                        local.set 5
                      end
                      local.get 5
                      local.get 3
                      i32.store offset=12
                      local.get 4
                      local.get 3
                      i32.store offset=8
                      local.get 3
                      local.get 4
                      i32.store offset=12
                      local.get 3
                      local.get 5
                      i32.store offset=8
                      br 4 (;@5;)
                    end
                    i32.const 31
                    local.set 4
                    block ;; label = @9
                      local.get 0
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 38
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 4
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 4
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 4
                    end
                    local.get 3
                    local.get 4
                    i32.store offset=28
                    local.get 3
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 4
                    i32.const 2
                    i32.shl
                    i32.const 1057648
                    i32.add
                    local.set 5
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1057348
                      local.tee 9
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 6
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 3
                      i32.store
                      i32.const 0
                      local.get 9
                      local.get 6
                      i32.or
                      i32.store offset=1057348
                      local.get 3
                      local.get 5
                      i32.store offset=24
                      local.get 3
                      local.get 3
                      i32.store offset=8
                      local.get 3
                      local.get 3
                      i32.store offset=12
                      br 4 (;@5;)
                    end
                    local.get 0
                    i32.const 0
                    i32.const 25
                    local.get 4
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 4
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 4
                    local.get 5
                    i32.load
                    local.set 9
                    loop ;; label = @9
                      local.get 9
                      local.tee 5
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 0
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 4
                      i32.const 29
                      i32.shr_u
                      local.set 9
                      local.get 4
                      i32.const 1
                      i32.shl
                      local.set 4
                      local.get 5
                      local.get 9
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 6
                      i32.load
                      local.tee 9
                      br_if 0 (;@9;)
                    end
                    local.get 6
                    local.get 3
                    i32.store
                    local.get 3
                    local.get 5
                    i32.store offset=24
                    local.get 3
                    local.get 3
                    i32.store offset=12
                    local.get 3
                    local.get 3
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  local.get 5
                  i32.load offset=8
                  local.tee 4
                  local.get 7
                  i32.store offset=12
                  local.get 5
                  local.get 7
                  i32.store offset=8
                  local.get 7
                  i32.const 0
                  i32.store offset=24
                  local.get 7
                  local.get 5
                  i32.store offset=12
                  local.get 7
                  local.get 4
                  i32.store offset=8
                end
                local.get 2
                i32.const 8
                i32.add
                local.set 4
                br 5 (;@1;)
              end
              local.get 5
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.store offset=12
              local.get 5
              local.get 3
              i32.store offset=8
              local.get 3
              i32.const 0
              i32.store offset=24
              local.get 3
              local.get 5
              i32.store offset=12
              local.get 3
              local.get 4
              i32.store offset=8
            end
            i32.const 0
            i32.load offset=1057356
            local.tee 4
            local.get 7
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1057368
            local.tee 3
            local.get 7
            i32.add
            local.tee 5
            local.get 4
            local.get 7
            i32.sub
            local.tee 4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.get 4
            i32.store offset=1057356
            i32.const 0
            local.get 5
            i32.store offset=1057368
            local.get 3
            local.get 7
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 3
            i32.const 8
            i32.add
            local.set 4
            br 3 (;@1;)
          end
          i32.const 0
          local.set 4
          i32.const 0
          i32.const 48
          i32.store offset=1057840
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1057648
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              local.tee 10
              i32.store offset=1057348
              br 2 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.const 20
            local.get 2
            i32.load offset=16
            local.get 9
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 2
          i32.store offset=24
          block ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 0
            i32.store offset=24
          end
          local.get 9
          i32.const 20
          i32.add
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 20
          i32.add
          local.get 4
          i32.store
          local.get 4
          local.get 0
          i32.store offset=24
        end
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 9
            local.get 3
            local.get 7
            i32.add
            local.tee 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 4
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 9
          local.get 7
          i32.add
          local.tee 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 9
          local.get 7
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
          block ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -8
            i32.and
            i32.const 1057384
            i32.add
            local.set 4
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=1057344
                local.tee 5
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 3
                i32.or
                i32.store offset=1057344
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 3
            end
            local.get 3
            local.get 0
            i32.store offset=12
            local.get 4
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 4
            i32.store offset=12
            local.get 0
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 4
          block ;; label = @4
            local.get 3
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 4
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 4
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 4
          end
          local.get 0
          local.get 4
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 4
          i32.const 2
          i32.shl
          i32.const 1057648
          i32.add
          local.set 5
          block ;; label = @4
            local.get 10
            i32.const 1
            local.get 4
            i32.shl
            local.tee 7
            i32.and
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.store
            i32.const 0
            local.get 10
            local.get 7
            i32.or
            i32.store offset=1057348
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 4
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 4
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 4
          local.get 5
          i32.load
          local.set 7
          block ;; label = @4
            loop ;; label = @5
              local.get 7
              local.tee 5
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 29
              i32.shr_u
              local.set 7
              local.get 4
              i32.const 1
              i32.shl
              local.set 4
              local.get 5
              local.get 7
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 6
              i32.load
              local.tee 7
              br_if 0 (;@5;)
            end
            local.get 6
            local.get 0
            i32.store
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=8
          local.tee 4
          local.get 0
          i32.store offset=12
          local.get 5
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 0
          local.get 4
          i32.store offset=8
        end
        local.get 9
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 11
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 1057648
            i32.add
            local.tee 4
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 9
            i32.store
            local.get 9
            br_if 1 (;@3;)
            i32.const 0
            local.get 10
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=1057348
            br 2 (;@2;)
          end
          local.get 11
          i32.const 16
          i32.const 20
          local.get 11
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 9
          i32.store
          local.get 9
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 9
        local.get 11
        i32.store offset=24
        block ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.store offset=16
          local.get 4
          local.get 9
          i32.store offset=24
        end
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.const 20
        i32.add
        local.get 4
        i32.store
        local.get 4
        local.get 9
        i32.store offset=24
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 7
          i32.add
          local.tee 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 7
        i32.add
        local.tee 5
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 7
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 5
        local.get 3
        i32.add
        local.get 3
        i32.store
        block ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const -8
          i32.and
          i32.const 1057384
          i32.add
          local.set 7
          i32.const 0
          i32.load offset=1057364
          local.set 4
          block ;; label = @4
            block ;; label = @5
              i32.const 1
              local.get 8
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 9
              local.get 6
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 9
              local.get 6
              i32.or
              i32.store offset=1057344
              local.get 7
              local.set 9
              br 1 (;@4;)
            end
            local.get 7
            i32.load offset=8
            local.set 9
          end
          local.get 9
          local.get 4
          i32.store offset=12
          local.get 7
          local.get 4
          i32.store offset=8
          local.get 4
          local.get 7
          i32.store offset=12
          local.get 4
          local.get 9
          i32.store offset=8
        end
        i32.const 0
        local.get 5
        i32.store offset=1057364
        i32.const 0
        local.get 3
        i32.store offset=1057352
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 4
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $free (;151;) (type 1) (param i32)
    local.get 0
    call $dlfree
  )
  (func $dlfree (;152;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=1057360
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block ;; label = @3
          local.get 1
          i32.const 0
          i32.load offset=1057364
          i32.eq
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 2
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=8
            local.tee 4
            local.get 2
            i32.const 3
            i32.shr_u
            local.tee 5
            i32.const 3
            i32.shl
            i32.const 1057384
            i32.add
            local.tee 6
            i32.eq
            drop
            block ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 2
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1057344
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1057344
              br 3 (;@2;)
            end
            local.get 2
            local.get 6
            i32.eq
            drop
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 2
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 1
          i32.load offset=24
          local.set 7
          block ;; label = @4
            block ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 6
              local.get 1
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              i32.load offset=8
              local.tee 2
              local.get 4
              i32.lt_u
              drop
              local.get 6
              local.get 2
              i32.store offset=8
              local.get 2
              local.get 6
              i32.store offset=12
              br 1 (;@4;)
            end
            block ;; label = @5
              local.get 1
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 1
              i32.const 16
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            loop ;; label = @5
              local.get 2
              local.set 5
              local.get 4
              local.tee 6
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.load offset=16
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 7
          i32.eqz
          br_if 1 (;@2;)
          block ;; label = @4
            block ;; label = @5
              local.get 1
              local.get 1
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1057648
              i32.add
              local.tee 2
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1057348
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=1057348
              br 3 (;@2;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block ;; label = @4
            local.get 1
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        i32.const 0
        local.get 0
        i32.store offset=1057352
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        return
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 3
            i32.const 0
            i32.load offset=1057368
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1057368
            i32.const 0
            i32.const 0
            i32.load offset=1057356
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1057356
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.load offset=1057364
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1057352
            i32.const 0
            i32.const 0
            i32.store offset=1057364
            return
          end
          block ;; label = @4
            local.get 3
            i32.const 0
            i32.load offset=1057364
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1057364
            i32.const 0
            i32.const 0
            i32.load offset=1057352
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1057352
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            return
          end
          local.get 2
          i32.const -8
          i32.and
          local.get 0
          i32.add
          local.set 0
          block ;; label = @4
            block ;; label = @5
              local.get 2
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=8
              local.tee 4
              local.get 2
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1057384
              i32.add
              local.tee 6
              i32.eq
              drop
              block ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 2
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1057344
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1057344
                br 2 (;@4;)
              end
              local.get 2
              local.get 6
              i32.eq
              drop
              local.get 2
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 2
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=24
            local.set 7
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 6
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=8
                local.tee 2
                i32.const 0
                i32.load offset=1057360
                i32.lt_u
                drop
                local.get 6
                local.get 2
                i32.store offset=8
                local.get 2
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 3
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 2
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 2
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block ;; label = @5
              block ;; label = @6
                local.get 3
                local.get 3
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1057648
                i32.add
                local.tee 2
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1057348
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1057348
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 3
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block ;; label = @5
              local.get 3
              i32.load offset=16
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 2
              i32.store offset=16
              local.get 2
              local.get 6
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 2
            i32.store
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=1057364
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1057352
          return
        end
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 1057384
        i32.add
        local.set 2
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=1057344
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=1057344
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 1057648
      i32.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=1057348
          local.tee 6
          i32.const 1
          local.get 2
          i32.shl
          local.tee 3
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.store
          i32.const 0
          local.get 6
          local.get 3
          i32.or
          i32.store offset=1057348
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 1
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 2
        local.get 4
        i32.load
        local.set 6
        block ;; label = @3
          loop ;; label = @4
            local.get 6
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 6
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 4
            local.get 6
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 3
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i32.store
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
      end
      i32.const 0
      i32.const 0
      i32.load offset=1057376
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=1057376
    end
  )
  (func $calloc (;153;) (type 4) (param i32 i32) (result i32)
    (local i32 i64)
    block ;; label = @1
      block ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i64.extend_i32_u
      local.get 1
      i64.extend_i32_u
      i64.mul
      local.tee 3
      i32.wrap_i64
      local.set 2
      local.get 1
      local.get 0
      i32.or
      i32.const 65536
      i32.lt_u
      br_if 0 (;@1;)
      i32.const -1
      local.get 2
      local.get 3
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.const 0
      i32.ne
      select
      local.set 2
    end
    block ;; label = @1
      local.get 2
      call $dlmalloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0
  )
  (func $realloc (;154;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    block ;; label = @1
      local.get 1
      i32.const -64
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1057840
      i32.const 0
      return
    end
    i32.const 16
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    local.get 1
    i32.const 11
    i32.lt_u
    select
    local.set 2
    local.get 0
    i32.const -4
    i32.add
    local.tee 3
    i32.load
    local.tee 4
    i32.const -8
    i32.and
    local.set 5
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 4
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.const 256
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          i32.const 4
          i32.or
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          i32.sub
          i32.const 0
          i32.load offset=1057824
          i32.const 1
          i32.shl
          i32.le_u
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 0
        i32.const -8
        i32.add
        local.tee 6
        local.get 5
        i32.add
        local.set 7
        block ;; label = @3
          local.get 5
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          i32.sub
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 2 (;@1;)
          local.get 3
          local.get 2
          local.get 4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 2
          i32.add
          local.tee 2
          local.get 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 7
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call $dispose_chunk
          local.get 0
          return
        end
        block ;; label = @3
          local.get 7
          i32.const 0
          i32.load offset=1057368
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1057356
          local.get 5
          i32.add
          local.tee 5
          local.get 2
          i32.le_u
          br_if 1 (;@2;)
          local.get 3
          local.get 2
          local.get 4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          i32.const 0
          local.get 6
          local.get 2
          i32.add
          local.tee 1
          i32.store offset=1057368
          i32.const 0
          local.get 5
          local.get 2
          i32.sub
          local.tee 2
          i32.store offset=1057356
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        block ;; label = @3
          local.get 7
          i32.const 0
          i32.load offset=1057364
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1057352
          local.get 5
          i32.add
          local.tee 5
          local.get 2
          i32.lt_u
          br_if 1 (;@2;)
          block ;; label = @4
            block ;; label = @5
              local.get 5
              local.get 2
              i32.sub
              local.tee 1
              i32.const 16
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 2
              i32.add
              local.tee 2
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 6
              local.get 5
              i32.add
              local.tee 5
              local.get 1
              i32.store
              local.get 5
              local.get 5
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 3
            local.get 4
            i32.const 1
            i32.and
            local.get 5
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 6
            local.get 5
            i32.add
            local.tee 1
            local.get 1
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.set 1
            i32.const 0
            local.set 2
          end
          i32.const 0
          local.get 2
          i32.store offset=1057364
          i32.const 0
          local.get 1
          i32.store offset=1057352
          local.get 0
          return
        end
        local.get 7
        i32.load offset=4
        local.tee 8
        i32.const 2
        i32.and
        br_if 0 (;@2;)
        local.get 8
        i32.const -8
        i32.and
        local.get 5
        i32.add
        local.tee 9
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 9
        local.get 2
        i32.sub
        local.set 10
        block ;; label = @3
          block ;; label = @4
            local.get 8
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 7
            i32.load offset=8
            local.tee 1
            local.get 8
            i32.const 3
            i32.shr_u
            local.tee 11
            i32.const 3
            i32.shl
            i32.const 1057384
            i32.add
            local.tee 8
            i32.eq
            drop
            block ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 5
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1057344
              i32.const -2
              local.get 11
              i32.rotl
              i32.and
              i32.store offset=1057344
              br 2 (;@3;)
            end
            local.get 5
            local.get 8
            i32.eq
            drop
            local.get 5
            local.get 1
            i32.store offset=8
            local.get 1
            local.get 5
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 7
          i32.load offset=24
          local.set 12
          block ;; label = @4
            block ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 8
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              local.get 7
              i32.load offset=8
              local.tee 1
              i32.const 0
              i32.load offset=1057360
              i32.lt_u
              drop
              local.get 8
              local.get 1
              i32.store offset=8
              local.get 1
              local.get 8
              i32.store offset=12
              br 1 (;@4;)
            end
            block ;; label = @5
              local.get 7
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 7
              i32.const 16
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              i32.const 0
              local.set 8
              br 1 (;@4;)
            end
            loop ;; label = @5
              local.get 1
              local.set 11
              local.get 5
              local.tee 8
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 8
              i32.const 16
              i32.add
              local.set 1
              local.get 8
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 11
            i32.const 0
            i32.store
          end
          local.get 12
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 7
              local.get 7
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1057648
              i32.add
              local.tee 1
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              local.get 8
              i32.store
              local.get 8
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1057348
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1057348
              br 2 (;@3;)
            end
            local.get 12
            i32.const 16
            i32.const 20
            local.get 12
            i32.load offset=16
            local.get 7
            i32.eq
            select
            i32.add
            local.get 8
            i32.store
            local.get 8
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 8
          local.get 12
          i32.store offset=24
          block ;; label = @4
            local.get 7
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 8
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 8
            i32.store offset=24
          end
          local.get 7
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 20
          i32.add
          local.get 1
          i32.store
          local.get 1
          local.get 8
          i32.store offset=24
        end
        block ;; label = @3
          local.get 10
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.const 1
          i32.and
          local.get 9
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 9
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        local.get 3
        local.get 2
        local.get 4
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store
        local.get 6
        local.get 2
        i32.add
        local.tee 1
        local.get 10
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 9
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 10
        call $dispose_chunk
        local.get 0
        return
      end
      block ;; label = @2
        local.get 1
        call $dlmalloc
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      i32.const -4
      i32.const -8
      local.get 3
      i32.load
      local.tee 5
      i32.const 3
      i32.and
      select
      local.get 5
      i32.const -8
      i32.and
      i32.add
      local.tee 5
      local.get 1
      local.get 5
      local.get 1
      i32.lt_u
      select
      call $memcpy
      local.set 1
      local.get 0
      call $dlfree
      local.get 1
      local.set 0
    end
    local.get 0
  )
  (func $dispose_chunk (;155;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 3
            i32.sub
            local.tee 0
            i32.const 0
            i32.load offset=1057364
            i32.eq
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1057384
              i32.add
              local.tee 6
              i32.eq
              drop
              local.get 0
              i32.load offset=12
              local.tee 3
              local.get 4
              i32.ne
              br_if 2 (;@3;)
              i32.const 0
              i32.const 0
              i32.load offset=1057344
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1057344
              br 3 (;@2;)
            end
            local.get 0
            i32.load offset=24
            local.set 7
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load offset=12
                local.tee 6
                local.get 0
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.const 0
                i32.load offset=1057360
                i32.lt_u
                drop
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 0
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 0
                i32.const 16
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 3
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 3
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 2 (;@2;)
            block ;; label = @5
              block ;; label = @6
                local.get 0
                local.get 0
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1057648
                i32.add
                local.tee 3
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1057348
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1057348
                br 4 (;@2;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 0
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 3 (;@2;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block ;; label = @5
              local.get 0
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
            br 2 (;@2;)
          end
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 2
          local.get 3
          i32.const -2
          i32.and
          i32.store offset=4
          i32.const 0
          local.get 1
          i32.store offset=1057352
          local.get 2
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          return
        end
        local.get 3
        local.get 6
        i32.eq
        drop
        local.get 3
        local.get 4
        i32.store offset=8
        local.get 4
        local.get 3
        i32.store offset=12
      end
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 2
            i32.const 0
            i32.load offset=1057368
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1057368
            i32.const 0
            i32.const 0
            i32.load offset=1057356
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1057356
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.load offset=1057364
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1057352
            i32.const 0
            i32.const 0
            i32.store offset=1057364
            return
          end
          block ;; label = @4
            local.get 2
            i32.const 0
            i32.load offset=1057364
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1057364
            i32.const 0
            i32.const 0
            i32.load offset=1057352
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1057352
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
            return
          end
          local.get 3
          i32.const -8
          i32.and
          local.get 1
          i32.add
          local.set 1
          block ;; label = @4
            block ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1057384
              i32.add
              local.tee 6
              i32.eq
              drop
              block ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 3
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1057344
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1057344
                br 2 (;@4;)
              end
              local.get 3
              local.get 6
              i32.eq
              drop
              local.get 3
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 3
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=24
            local.set 7
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 6
                local.get 2
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=8
                local.tee 3
                i32.const 0
                i32.load offset=1057360
                i32.lt_u
                drop
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 2
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 4
                local.set 5
                local.get 3
                local.tee 6
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 4
                local.get 6
                i32.load offset=16
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block ;; label = @5
              block ;; label = @6
                local.get 2
                local.get 2
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1057648
                i32.add
                local.tee 3
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1057348
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1057348
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 2
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 2
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
          end
          local.get 0
          local.get 1
          i32.add
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          i32.const 0
          i32.load offset=1057364
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1057352
          return
        end
        local.get 2
        local.get 3
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 0
        local.get 1
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block ;; label = @2
        local.get 1
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        i32.const 1057384
        i32.add
        local.set 3
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=1057344
            local.tee 4
            i32.const 1
            local.get 1
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 1
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 1
            i32.or
            i32.store offset=1057344
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
          local.set 1
        end
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 3
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 3
      block ;; label = @2
        local.get 1
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 38
        local.get 1
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 3
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 3
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 3
      i32.const 2
      i32.shl
      i32.const 1057648
      i32.add
      local.set 4
      block ;; label = @2
        i32.const 0
        i32.load offset=1057348
        local.tee 6
        i32.const 1
        local.get 3
        i32.shl
        local.tee 2
        i32.and
        br_if 0 (;@2;)
        local.get 4
        local.get 0
        i32.store
        i32.const 0
        local.get 6
        local.get 2
        i32.or
        i32.store offset=1057348
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 0
        i32.store offset=12
        return
      end
      local.get 1
      i32.const 0
      i32.const 25
      local.get 3
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 3
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 3
      local.get 4
      i32.load
      local.set 6
      block ;; label = @2
        loop ;; label = @3
          local.get 6
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 29
          i32.shr_u
          local.set 6
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 4
          local.get 6
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 2
          i32.load
          local.tee 6
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        i32.store
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 0
        i32.store offset=8
        return
      end
      local.get 4
      i32.load offset=8
      local.tee 1
      local.get 0
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 1
      i32.store offset=8
    end
  )
  (func $internal_memalign (;156;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 16
        local.get 0
        i32.const 16
        i32.gt_u
        select
        local.tee 2
        local.get 2
        i32.const -1
        i32.add
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      i32.const 32
      local.set 3
      loop ;; label = @2
        local.get 3
        local.tee 0
        i32.const 1
        i32.shl
        local.set 3
        local.get 0
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      i32.const -64
      local.get 0
      i32.sub
      local.get 1
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1057840
      i32.const 0
      return
    end
    block ;; label = @1
      local.get 0
      i32.const 16
      local.get 1
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 1
      i32.add
      i32.const 12
      i32.add
      call $dlmalloc
      local.tee 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 3
    i32.const -8
    i32.add
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const -1
        i32.add
        local.get 3
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.const -4
      i32.add
      local.tee 4
      i32.load
      local.tee 5
      i32.const -8
      i32.and
      local.get 3
      local.get 0
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      i32.and
      i32.const -8
      i32.add
      local.tee 3
      i32.const 0
      local.get 0
      local.get 3
      local.get 2
      i32.sub
      i32.const 15
      i32.gt_u
      select
      i32.add
      local.tee 0
      local.get 2
      i32.sub
      local.tee 3
      i32.sub
      local.set 6
      block ;; label = @2
        local.get 5
        i32.const 3
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i32.store offset=4
        local.get 0
        local.get 2
        i32.load
        local.get 3
        i32.add
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 6
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 6
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 4
      local.get 3
      local.get 4
      i32.load
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store
      local.get 2
      local.get 3
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 2
      local.get 3
      call $dispose_chunk
    end
    block ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const -8
      i32.and
      local.tee 2
      local.get 1
      i32.const 16
      i32.add
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 3
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.tee 3
      local.get 2
      local.get 1
      i32.sub
      local.tee 1
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.add
      local.tee 2
      local.get 2
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 3
      local.get 1
      call $dispose_chunk
    end
    local.get 0
    i32.const 8
    i32.add
  )
  (func $aligned_alloc (;157;) (type 4) (param i32 i32) (result i32)
    block ;; label = @1
      local.get 0
      i32.const 16
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    local.get 0
    local.get 1
    call $internal_memalign
  )
  (func $_Exit (;158;) (type 1) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable
  )
  (func $__wasilibc_ensure_environ (;159;) (type 0)
    block ;; label = @1
      i32.const 0
      i32.load offset=1057228
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      call $__wasilibc_initialize_environ
    end
  )
  (func $__wasilibc_initialize_environ (;160;) (type 0)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 12
        i32.add
        local.get 0
        i32.const 8
        i32.add
        call $__wasi_environ_sizes_get
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 0
          i32.load offset=12
          local.tee 1
          br_if 0 (;@3;)
          i32.const 1057844
          local.set 1
          br 2 (;@1;)
        end
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=8
            call $malloc
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 4
            call $calloc
            local.tee 1
            br_if 1 (;@3;)
            local.get 2
            call $free
          end
          i32.const 70
          call $_Exit
          unreachable
        end
        local.get 1
        local.get 2
        call $__wasi_environ_get
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        call $free
        local.get 1
        call $free
      end
      i32.const 71
      call $_Exit
      unreachable
    end
    i32.const 0
    local.get 1
    i32.store offset=1057228
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
  )
  (func $__wasi_environ_get (;161;) (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_environ_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_environ_sizes_get (;162;) (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_environ_sizes_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_proc_exit (;163;) (type 1) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable
  )
  (func $abort (;164;) (type 0)
    unreachable
    unreachable
  )
  (func $getcwd (;165;) (type 4) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    i32.load offset=1057232
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 2
        call $strdup
        local.tee 0
        br_if 1 (;@1;)
        i32.const 0
        i32.const 48
        i32.store offset=1057840
        i32.const 0
        return
      end
      block ;; label = @2
        local.get 2
        call $strlen
        i32.const 1
        i32.add
        local.get 1
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        call $strcpy
        return
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.const 68
      i32.store offset=1057840
    end
    local.get 0
  )
  (func $sbrk (;166;) (type 3) (param i32) (result i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=1057840
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable
  )
  (func $getenv (;167;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    call $__wasilibc_ensure_environ
    block ;; label = @1
      local.get 0
      i32.const 61
      call $__strchrnul
      local.tee 1
      local.get 0
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 2
    block ;; label = @1
      local.get 0
      local.get 1
      local.get 0
      i32.sub
      local.tee 3
      i32.add
      i32.load8_u
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1057228
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 4
      i32.add
      local.set 4
      block ;; label = @2
        loop ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 1
            local.get 3
            call $strncmp
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            i32.add
            local.tee 1
            i32.load8_u
            i32.const 61
            i32.eq
            br_if 2 (;@2;)
          end
          local.get 4
          i32.load
          local.set 1
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 2
    end
    local.get 2
  )
  (func $dummy (;168;) (type 0))
  (func $__wasm_call_dtors (;169;) (type 0)
    call $dummy
    call $dummy
  )
  (func $memcmp (;170;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        loop ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 4
          local.get 1
          i32.load8_u
          local.tee 5
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3
  )
  (func $memcpy (;171;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 32
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 1
          i32.add
          local.set 4
          local.get 1
          i32.const 1
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const -2
          i32.add
          local.set 3
          local.get 0
          i32.const 2
          i32.add
          local.set 4
          local.get 1
          i32.const 2
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=2
          i32.store8 offset=2
          local.get 2
          i32.const -3
          i32.add
          local.set 3
          local.get 0
          i32.const 3
          i32.add
          local.set 4
          local.get 1
          i32.const 3
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=3
          i32.store8 offset=3
          local.get 2
          i32.const -4
          i32.add
          local.set 3
          local.get 0
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          i32.const 4
          i32.add
          local.set 5
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        local.get 0
        return
      end
      local.get 2
      local.set 3
      local.get 0
      local.set 4
      local.get 1
      local.set 5
    end
    block ;; label = @1
      block ;; label = @2
        local.get 4
        i32.const 3
        i32.and
        local.tee 2
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 16
            i32.ge_u
            br_if 0 (;@4;)
            local.get 3
            local.set 2
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 3
            i32.const -16
            i32.add
            local.tee 2
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            i32.const 16
            i32.add
            local.set 4
            local.get 5
            i32.const 16
            i32.add
            local.set 5
            local.get 2
            local.set 3
          end
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          local.set 2
          loop ;; label = @4
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            local.get 5
            i64.load offset=16 align=4
            i64.store offset=16 align=4
            local.get 4
            local.get 5
            i64.load offset=24 align=4
            i64.store offset=24 align=4
            local.get 4
            i32.const 32
            i32.add
            local.set 4
            local.get 5
            i32.const 32
            i32.add
            local.set 5
            local.get 2
            i32.const -32
            i32.add
            local.tee 2
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        block ;; label = @3
          local.get 2
          i32.const 8
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i64.load align=4
          i64.store align=4
          local.get 5
          i32.const 8
          i32.add
          local.set 5
          local.get 4
          i32.const 8
          i32.add
          local.set 4
        end
        block ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.set 5
          local.get 4
          i32.const 4
          i32.add
          local.set 4
        end
        block ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 5
          i32.const 2
          i32.add
          local.set 5
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 5
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.const 32
                i32.lt_u
                br_if 0 (;@6;)
                block ;; label = @7
                  block ;; label = @8
                    local.get 2
                    i32.const -1
                    i32.add
                    br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 7 (;@1;)
                  end
                  local.get 4
                  local.get 5
                  i32.load
                  i32.store16 align=1
                  local.get 4
                  local.get 5
                  i32.const 2
                  i32.add
                  i32.load align=2
                  i32.store offset=2
                  local.get 4
                  local.get 5
                  i32.const 6
                  i32.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  local.get 4
                  i32.const 18
                  i32.add
                  local.set 2
                  local.get 5
                  i32.const 18
                  i32.add
                  local.set 1
                  i32.const 14
                  local.set 6
                  local.get 5
                  i32.const 14
                  i32.add
                  i32.load align=2
                  local.set 5
                  i32.const 14
                  local.set 3
                  br 3 (;@4;)
                end
                local.get 4
                local.get 5
                i32.load
                i32.store8
                local.get 4
                local.get 5
                i32.const 1
                i32.add
                i32.load align=1
                i32.store offset=1
                local.get 4
                local.get 5
                i32.const 5
                i32.add
                i64.load align=1
                i64.store offset=5 align=4
                local.get 4
                i32.const 17
                i32.add
                local.set 2
                local.get 5
                i32.const 17
                i32.add
                local.set 1
                i32.const 13
                local.set 6
                local.get 5
                i32.const 13
                i32.add
                i32.load align=1
                local.set 5
                i32.const 15
                local.set 3
                br 2 (;@4;)
              end
              block ;; label = @6
                block ;; label = @7
                  local.get 3
                  i32.const 16
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 4
                  local.set 2
                  local.get 5
                  local.set 1
                  br 1 (;@6;)
                end
                local.get 4
                local.get 5
                i32.load8_u
                i32.store8
                local.get 4
                local.get 5
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 5
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 5
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 5
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i32.const 16
                i32.add
                local.set 2
                local.get 5
                i32.const 16
                i32.add
                local.set 1
              end
              local.get 3
              i32.const 8
              i32.and
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 5
            i32.load
            local.tee 2
            i32.store8
            local.get 4
            local.get 2
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 2
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 5
            i32.const 3
            i32.add
            i32.load align=1
            i32.store offset=3
            local.get 4
            local.get 5
            i32.const 7
            i32.add
            i64.load align=1
            i64.store offset=7 align=4
            local.get 4
            i32.const 19
            i32.add
            local.set 2
            local.get 5
            i32.const 19
            i32.add
            local.set 1
            i32.const 15
            local.set 6
            local.get 5
            i32.const 15
            i32.add
            i32.load align=1
            local.set 5
            i32.const 13
            local.set 3
          end
          local.get 4
          local.get 6
          i32.add
          local.get 5
          i32.store
        end
        local.get 2
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      block ;; label = @2
        local.get 3
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load align=1
        i32.store align=1
        local.get 2
        i32.const 4
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      block ;; label = @2
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i32.const 2
        i32.add
        local.set 2
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 3
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0
  )
  (func $memmove (;172;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 33
          i32.ge_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          local.get 0
          local.get 2
          i32.add
          local.tee 3
          i32.sub
          i32.const 0
          local.get 2
          i32.const 1
          i32.shl
          i32.sub
          i32.gt_u
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.xor
      i32.const 3
      i32.and
      local.set 4
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 1
            i32.ge_u
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.set 5
              local.get 0
              local.set 3
              br 3 (;@2;)
            end
            block ;; label = @5
              local.get 0
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 2
              local.set 5
              local.get 0
              local.set 3
              br 2 (;@3;)
            end
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 2
            i32.const -1
            i32.add
            local.set 5
            block ;; label = @5
              local.get 0
              i32.const 1
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 5
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 2
            i32.const -2
            i32.add
            local.set 5
            block ;; label = @5
              local.get 0
              i32.const 2
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 2
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 5
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 2
            i32.const -3
            i32.add
            local.set 5
            block ;; label = @5
              local.get 0
              i32.const 3
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 3
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 5
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=3
            i32.store8 offset=3
            local.get 0
            i32.const 4
            i32.add
            local.set 3
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 2
            i32.const -4
            i32.add
            local.set 5
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 3
              i32.const 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -1
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -2
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -3
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -4
              i32.add
              local.tee 2
              i32.add
              local.get 1
              local.get 2
              i32.add
              i32.load8_u
              i32.store8
            end
            local.get 2
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 2
              i32.const -4
              i32.add
              local.tee 6
              i32.const 2
              i32.shr_u
              i32.const 1
              i32.add
              i32.const 3
              i32.and
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const -4
              i32.add
              local.set 4
              local.get 0
              i32.const -4
              i32.add
              local.set 5
              loop ;; label = @6
                local.get 5
                local.get 2
                i32.add
                local.get 4
                local.get 2
                i32.add
                i32.load
                i32.store
                local.get 2
                i32.const -4
                i32.add
                local.set 2
                local.get 3
                i32.const -1
                i32.add
                local.tee 3
                br_if 0 (;@6;)
              end
            end
            local.get 6
            i32.const 12
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -16
            i32.add
            local.set 5
            local.get 0
            i32.const -16
            i32.add
            local.set 6
            loop ;; label = @5
              local.get 6
              local.get 2
              i32.add
              local.tee 3
              i32.const 12
              i32.add
              local.get 5
              local.get 2
              i32.add
              local.tee 4
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 4
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 4
              i32.const 4
              i32.add
              i32.load
              i32.store
              local.get 3
              local.get 4
              i32.load
              i32.store
              local.get 2
              i32.const -16
              i32.add
              local.tee 2
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          local.set 3
          block ;; label = @4
            local.get 2
            i32.const 3
            i32.and
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const -1
            i32.add
            local.set 5
            local.get 0
            i32.const -1
            i32.add
            local.set 6
            local.get 2
            local.set 3
            loop ;; label = @5
              local.get 6
              local.get 3
              i32.add
              local.get 5
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              local.get 3
              i32.const -1
              i32.add
              local.set 3
              local.get 4
              i32.const -1
              i32.add
              local.tee 4
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.const 4
          i32.lt_u
          br_if 2 (;@1;)
          local.get 1
          i32.const -4
          i32.add
          local.set 4
          local.get 0
          i32.const -4
          i32.add
          local.set 5
          loop ;; label = @4
            local.get 5
            local.get 3
            i32.add
            local.tee 1
            i32.const 3
            i32.add
            local.get 4
            local.get 3
            i32.add
            local.tee 2
            i32.const 3
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 2
            i32.add
            local.get 2
            i32.const 2
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 1
            i32.add
            local.get 2
            i32.const 1
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            local.get 2
            i32.load8_u
            i32.store8
            local.get 3
            i32.const -4
            i32.add
            local.tee 3
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 5
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 5
          i32.const -4
          i32.add
          local.tee 4
          i32.const 2
          i32.shr_u
          i32.const 1
          i32.add
          i32.const 7
          i32.and
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 3
            local.get 1
            i32.load
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 3
            i32.const 4
            i32.add
            local.set 3
            local.get 5
            i32.const -4
            i32.add
            local.set 5
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            br_if 0 (;@4;)
          end
        end
        local.get 4
        i32.const 28
        i32.lt_u
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 3
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 3
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 3
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 3
          local.get 1
          i32.load offset=16
          i32.store offset=16
          local.get 3
          local.get 1
          i32.load offset=20
          i32.store offset=20
          local.get 3
          local.get 1
          i32.load offset=24
          i32.store offset=24
          local.get 3
          local.get 1
          i32.load offset=28
          i32.store offset=28
          local.get 1
          i32.const 32
          i32.add
          local.set 1
          local.get 3
          i32.const 32
          i32.add
          local.set 3
          local.get 5
          i32.const -32
          i32.add
          local.tee 5
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          local.get 5
          i32.const 7
          i32.and
          local.tee 4
          br_if 0 (;@3;)
          local.get 5
          local.set 2
          br 1 (;@2;)
        end
        local.get 5
        local.set 2
        loop ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 2
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 4
          i32.const -1
          i32.add
          local.tee 4
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 8
      i32.lt_u
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 2
        i32.const -8
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $memset (;173;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block ;; label = @1
      local.get 2
      i32.const 33
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 5
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=24
      local.get 5
      local.get 3
      i32.store offset=20
      local.get 5
      local.get 3
      i32.store offset=16
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 5
      local.get 2
      i32.add
      local.set 2
      loop ;; label = @2
        local.get 2
        local.get 6
        i64.store offset=24
        local.get 2
        local.get 6
        i64.store offset=16
        local.get 2
        local.get 6
        i64.store offset=8
        local.get 2
        local.get 6
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const -32
        i32.add
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $__strchrnul (;174;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 255
            i32.and
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            block ;; label = @5
              local.get 0
              i32.load8_u
              local.tee 3
              br_if 0 (;@5;)
              local.get 0
              return
            end
            local.get 3
            local.get 1
            i32.const 255
            i32.and
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            return
          end
          local.get 0
          local.get 0
          call $strlen
          i32.add
          return
        end
        block ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block ;; label = @3
          local.get 0
          i32.const 2
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block ;; label = @3
          local.get 0
          i32.const 3
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 0
      end
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.const -1
        i32.xor
        local.get 3
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 16843009
        i32.mul
        local.set 2
        loop ;; label = @3
          local.get 3
          local.get 2
          i32.xor
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.load
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const -1
      i32.add
      local.set 3
      loop ;; label = @2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.load8_u
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.const 255
        i32.and
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3
  )
  (func $__stpcpy (;175;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          local.get 0
          i32.xor
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u
          local.set 2
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.load8_u
          local.tee 2
          i32.store8
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 0
            return
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 2
          block ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 2
          i32.add
          local.set 2
          block ;; label = @4
            local.get 1
            i32.const 2
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 3
          i32.add
          local.set 2
          block ;; label = @4
            local.get 1
            i32.const 3
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
        end
        local.get 1
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 0
          local.get 2
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          i32.load
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 2
      i32.store8
      block ;; label = @2
        local.get 2
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        local.get 0
        return
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      local.set 2
      loop ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        local.tee 0
        i32.store8 offset=1
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 0
        br_if 0 (;@2;)
      end
    end
    local.get 2
  )
  (func $strcpy (;176;) (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__stpcpy
    drop
    local.get 0
  )
  (func $strdup (;177;) (type 3) (param i32) (result i32)
    (local i32 i32)
    block ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      call $memcpy
      drop
    end
    local.get 2
  )
  (func $#func178<dummy> (@name "dummy") (;178;) (type 4) (param i32 i32) (result i32)
    local.get 0
  )
  (func $__lctrans (;179;) (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $#func178<dummy>
  )
  (func $strerror (;180;) (type 3) (param i32) (result i32)
    (local i32)
    block ;; label = @1
      i32.const 0
      i32.load offset=1057872
      local.tee 1
      br_if 0 (;@1;)
      i32.const 1057848
      local.set 1
      i32.const 0
      i32.const 1057848
      i32.store offset=1057872
    end
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i32.const 1
    i32.shl
    i32.const 1055536
    i32.add
    i32.load16_u
    i32.const 1053974
    i32.add
    local.get 1
    i32.load offset=20
    call $__lctrans
  )
  (func $strerror_r (;181;) (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        local.get 0
        call $strerror
        local.tee 0
        call $strlen
        local.tee 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 68
        local.set 3
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        call $memcpy
        local.get 2
        i32.add
        i32.const 0
        i32.store8
        i32.const 68
        return
      end
      local.get 1
      local.get 0
      local.get 3
      i32.const 1
      i32.add
      call $memcpy
      drop
      i32.const 0
      local.set 3
    end
    local.get 3
  )
  (func $strlen (;182;) (type 3) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    local.set 1
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 1
      i32.const -5
      i32.add
      local.set 1
      loop ;; label = @2
        local.get 1
        i32.const 5
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
      loop ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub
  )
  (func $strncmp (;183;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      loop ;; label = @2
        block ;; label = @3
          local.get 1
          i32.load8_u
          local.tee 5
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          local.get 5
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        i32.load8_u
        local.set 4
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 4
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 255
    i32.and
    local.get 1
    i32.load8_u
    i32.sub
  )
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h285a282621bac8daE (;184;) (type 1) (param i32))
  (func $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17hb8eb2859becdc12aE (;185;) (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.const 1055692
    i32.const 11
    call $_ZN4core3fmt9Formatter9write_str17hf69c1071e35879f4E
  )
  (func $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E (;186;) (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1055720
    i32.store offset=8
    local.get 0
    i64.const 0
    i64.store offset=20 align=4
    local.get 0
    i32.const 1055692
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1055756
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN5alloc7raw_vec11finish_grow17hb77df345169e0ff0E (;187;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1057245
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 4
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1057245
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 4
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store
  )
  (func $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E (;188;) (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $__rust_alloc_error_handler
    unreachable
  )
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h1bebce0a7f69c2d6E (;189;) (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17hb77df345169e0ff0E
      block ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
    unreachable
  )
  (func $_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h0a9657406ab05731E (;190;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 1
          i32.add
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 4
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              i32.const 0
              i32.load8_u offset=1057245
              drop
              local.get 4
              i32.const 1
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 1 (;@4;)
              local.get 5
              local.get 1
              local.get 2
              call $memcpy
              local.set 6
              block ;; label = @6
                local.get 2
                i32.const 8
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 8
                i32.add
                i32.const 0
                local.get 1
                local.get 2
                call $_ZN4core5slice6memchr14memchr_aligned17h72583c77567a47aaE
                local.get 3
                i32.load offset=12
                local.set 7
                local.get 3
                i32.load offset=8
                local.set 5
                br 5 (;@1;)
              end
              block ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                i32.const 0
                local.set 5
                br 5 (;@1;)
              end
              block ;; label = @6
                local.get 1
                i32.load8_u
                br_if 0 (;@6;)
                i32.const 1
                local.set 5
                i32.const 0
                local.set 7
                br 5 (;@1;)
              end
              i32.const 1
              local.set 5
              local.get 2
              i32.const 1
              i32.eq
              br_if 3 (;@2;)
              block ;; label = @6
                local.get 1
                i32.load8_u offset=1
                br_if 0 (;@6;)
                i32.const 1
                local.set 7
                br 5 (;@1;)
              end
              i32.const 2
              local.set 7
              local.get 2
              i32.const 2
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=2
              i32.eqz
              br_if 4 (;@1;)
              i32.const 3
              local.set 7
              local.get 2
              i32.const 3
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=3
              i32.eqz
              br_if 4 (;@1;)
              i32.const 4
              local.set 7
              local.get 2
              i32.const 4
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=4
              i32.eqz
              br_if 4 (;@1;)
              i32.const 5
              local.set 7
              local.get 2
              i32.const 5
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=5
              i32.eqz
              br_if 4 (;@1;)
              local.get 2
              local.set 7
              i32.const 0
              local.set 5
              local.get 2
              i32.const 6
              i32.eq
              br_if 4 (;@1;)
              local.get 2
              i32.const 6
              local.get 1
              i32.load8_u offset=6
              local.tee 1
              select
              local.set 7
              local.get 1
              i32.eqz
              local.set 5
              br 4 (;@1;)
            end
            call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
            unreachable
          end
          i32.const 1
          local.get 4
          call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
          unreachable
        end
        i32.const 1055804
        call $_ZN4core6option13unwrap_failed17h5cf22e6c8f50e086E
        unreachable
      end
      local.get 2
      local.set 7
      i32.const 0
      local.set 5
    end
    block ;; label = @1
      block ;; label = @2
        local.get 5
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.store offset=28
        local.get 3
        local.get 6
        i32.store offset=24
        local.get 3
        local.get 4
        i32.store offset=20
        local.get 3
        local.get 3
        i32.const 20
        i32.add
        call $_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17hd03f69adb0be1c6eE
        local.get 0
        local.get 3
        i64.load
        i64.store offset=4 align=4
        local.get 0
        i32.const -2147483648
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.store offset=8
      local.get 0
      local.get 6
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store
      local.get 0
      local.get 7
      i32.store offset=12
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17hd03f69adb0be1c6eE (;191;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i32.load
                local.tee 3
                local.get 1
                i32.load offset=8
                local.tee 4
                i32.ne
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.add
                local.tee 3
                i32.eqz
                br_if 4 (;@2;)
                local.get 3
                i32.const -1
                i32.xor
                i32.const 31
                i32.shr_u
                local.set 5
                block ;; label = @7
                  block ;; label = @8
                    local.get 4
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 2
                  local.get 4
                  i32.store offset=28
                  local.get 2
                  local.get 1
                  i32.load offset=4
                  i32.store offset=20
                  i32.const 1
                  local.set 6
                end
                local.get 2
                local.get 6
                i32.store offset=24
                local.get 2
                i32.const 8
                i32.add
                local.get 5
                local.get 3
                local.get 2
                i32.const 20
                i32.add
                call $_ZN5alloc7raw_vec11finish_grow17hb77df345169e0ff0E
                local.get 2
                i32.load offset=8
                br_if 1 (;@5;)
                local.get 2
                i32.load offset=12
                local.set 5
                local.get 1
                local.get 3
                i32.store
                local.get 1
                local.get 5
                i32.store offset=4
              end
              block ;; label = @6
                local.get 4
                local.get 3
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                local.get 4
                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h1bebce0a7f69c2d6E
                local.get 1
                i32.load
                local.set 3
                local.get 1
                i32.load offset=8
                local.set 4
              end
              local.get 1
              local.get 4
              i32.const 1
              i32.add
              local.tee 5
              i32.store offset=8
              local.get 1
              i32.load offset=4
              local.tee 1
              local.get 4
              i32.add
              i32.const 0
              i32.store8
              local.get 3
              local.get 5
              i32.gt_u
              br_if 1 (;@4;)
              local.get 1
              local.set 4
              br 2 (;@3;)
            end
            local.get 2
            i32.load offset=12
            local.tee 1
            i32.eqz
            br_if 2 (;@2;)
            local.get 1
            local.get 2
            i32.load offset=16
            call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
            unreachable
          end
          block ;; label = @4
            local.get 5
            br_if 0 (;@4;)
            i32.const 1
            local.set 4
            local.get 1
            local.get 3
            i32.const 1
            call $__rust_dealloc
            br 1 (;@3;)
          end
          local.get 1
          local.get 3
          i32.const 1
          local.get 5
          call $__rust_realloc
          local.tee 4
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 0
        local.get 5
        i32.store offset=4
        local.get 0
        local.get 4
        i32.store
        local.get 2
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h3094362fefc0b654E
      unreachable
    end
    i32.const 1
    local.get 5
    call $_ZN5alloc5alloc18handle_alloc_error17h2b93a66226c8bd09E
    unreachable
  )
  (func $_ZN5alloc4sync32arcinner_layout_for_value_layout17haa4199be581fd905E (;192;) (type 6) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      local.get 1
      i32.const 7
      i32.add
      i32.const 0
      local.get 1
      i32.sub
      i32.and
      local.tee 4
      local.get 4
      i32.const -8
      i32.add
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 2
      i32.add
      local.tee 2
      local.get 4
      i32.lt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const -2147483648
      local.get 1
      i32.const 4
      local.get 1
      i32.const 4
      i32.gt_u
      select
      local.tee 1
      i32.sub
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 1
      local.get 2
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 1
      i32.sub
      i32.and
      i32.store offset=4
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1055820
    i32.const 43
    local.get 3
    i32.const 15
    i32.add
    i32.const 1055864
    i32.const 1055908
    call $_ZN4core6result13unwrap_failed17h30d23efcc9e41efcE
    unreachable
  )
  (func $_ZN4core3ops8function6FnOnce9call_once17h9bac24e69c91fbc4E (;193;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    drop
    loop (result i32) ;; label = @1
      br 0 (;@1;)
    end
  )
  (func $_ZN4core3ptr25drop_in_place$LT$char$GT$17h2adcaa2036c619b6E (;194;) (type 1) (param i32))
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h4d68abdeed11fa95E (;195;) (type 1) (param i32))
  (func $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E (;196;) (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store16 offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    i32.const 1056064
    i32.store offset=16
    local.get 2
    i32.const 1055924
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable
  )
  (func $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE (;197;) (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index29slice_start_index_len_fail_rt17hb3fc619a6189ac16E
    unreachable
  )
  (func $_ZN4core9panicking18panic_bounds_check17hedaf9adac3cd8dfbE (;198;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1056180
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.store offset=40
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE (;199;) (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index27slice_end_index_len_fail_rt17hd4aaabdb4dcf49d2E
    unreachable
  )
  (func $_ZN4core3fmt9Formatter3pad17h9c96c844f75776beE (;200;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 3
      local.get 0
      i32.load offset=8
      local.tee 4
      i32.or
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 5
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.load offset=12
            local.tee 6
            br_if 0 (;@4;)
            i32.const 0
            local.set 7
            local.get 1
            local.set 8
            br 1 (;@3;)
          end
          i32.const 0
          local.set 7
          local.get 1
          local.set 8
          loop ;; label = @4
            local.get 8
            local.tee 4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            block ;; label = @5
              block ;; label = @6
                local.get 4
                i32.load8_s
                local.tee 8
                i32.const -1
                i32.le_s
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 8
                i32.const -32
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 2
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 8
                i32.const -16
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 3
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              local.get 4
              i32.load8_u offset=2
              i32.const 63
              i32.and
              i32.const 6
              i32.shl
              local.get 4
              i32.load8_u offset=1
              i32.const 63
              i32.and
              i32.const 12
              i32.shl
              i32.or
              local.get 4
              i32.load8_u offset=3
              i32.const 63
              i32.and
              i32.or
              local.get 8
              i32.const 255
              i32.and
              i32.const 18
              i32.shl
              i32.const 1835008
              i32.and
              i32.or
              i32.const 1114112
              i32.eq
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 8
            end
            local.get 7
            local.get 4
            i32.sub
            local.get 8
            i32.add
            local.set 7
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 8
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 8
          i32.load8_s
          local.tee 4
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 4
          i32.const -32
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.const -16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          i32.load8_u offset=2
          i32.const 63
          i32.and
          i32.const 6
          i32.shl
          local.get 8
          i32.load8_u offset=1
          i32.const 63
          i32.and
          i32.const 12
          i32.shl
          i32.or
          local.get 8
          i32.load8_u offset=3
          i32.const 63
          i32.and
          i32.or
          local.get 4
          i32.const 255
          i32.and
          i32.const 18
          i32.shl
          i32.const 1835008
          i32.and
          i32.or
          i32.const 1114112
          i32.eq
          br_if 1 (;@2;)
        end
        block ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 7
            local.get 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 7
            local.get 2
            i32.eq
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 7
          i32.add
          i32.load8_s
          i32.const -64
          i32.lt_s
          br_if 1 (;@2;)
        end
        local.get 7
        local.set 2
      end
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      local.get 0
      i32.load offset=4
      local.set 3
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          call $_ZN4core3str5count14do_count_chars17h880d99e06b2a5187E
          local.set 4
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.const 3
        i32.and
        local.set 6
        block ;; label = @3
          block ;; label = @4
            local.get 2
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            i32.const 0
            local.set 7
            br 1 (;@3;)
          end
          local.get 2
          i32.const 12
          i32.and
          local.set 5
          i32.const 0
          local.set 4
          i32.const 0
          local.set 7
          loop ;; label = @4
            local.get 4
            local.get 1
            local.get 7
            i32.add
            local.tee 8
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 4
            local.get 5
            local.get 7
            i32.const 4
            i32.add
            local.tee 7
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        i32.add
        local.set 8
        loop ;; label = @3
          local.get 4
          local.get 8
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 4
          local.get 8
          i32.const 1
          i32.add
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
        end
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.sub
          local.set 5
          i32.const 0
          local.set 4
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load8_u offset=32
                br_table 2 (;@4;) 0 (;@6;) 1 (;@5;) 2 (;@4;) 2 (;@4;)
              end
              local.get 5
              local.set 4
              i32.const 0
              local.set 5
              br 1 (;@4;)
            end
            local.get 5
            i32.const 1
            i32.shr_u
            local.set 4
            local.get 5
            i32.const 1
            i32.add
            i32.const 1
            i32.shr_u
            local.set 5
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 0
          i32.load offset=16
          local.set 6
          local.get 0
          i32.load offset=24
          local.set 8
          local.get 0
          i32.load offset=20
          local.set 7
          loop ;; label = @4
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            i32.eqz
            br_if 2 (;@2;)
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 4)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      i32.const 1
      local.set 4
      block ;; label = @2
        local.get 7
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=12
        call_indirect (type 5)
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        block ;; label = @3
          loop ;; label = @4
            block ;; label = @5
              local.get 5
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              local.set 4
              br 2 (;@3;)
            end
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 4)
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 4
          i32.const -1
          i32.add
          local.set 4
        end
        local.get 4
        local.get 5
        i32.lt_u
        local.set 4
      end
      local.get 4
      return
    end
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
  )
  (func $_ZN4core9panicking5panic17h0d08f040be55464aE (;201;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i64.const 0
    i64.store offset=12 align=4
    local.get 3
    i32.const 1055924
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h3921da4b80c91f1dE (;202;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h1fec4fd64e256c58E
  )
  (func $_ZN4core3fmt5write17h5aa565b06adfe6beE (;203;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 3
    i32.store8 offset=44
    local.get 3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 3
    local.get 1
    i32.store offset=36
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.set 1
              local.get 0
              i32.const 3
              i32.shl
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop ;; label = @6
                block ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=32
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (type 5)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.load offset=4
                call_indirect (type 4)
                br_if 3 (;@3;)
                local.get 1
                i32.const 8
                i32.add
                local.set 1
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 6
            loop ;; label = @5
              block ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=32
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=36
                i32.load offset=12
                call_indirect (type 5)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 6
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 7
              i32.const 0
              local.set 10
              i32.const 0
              local.set 11
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 11
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load offset=4
                  i32.const 52
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 7
              i32.store offset=16
              local.get 3
              local.get 11
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 7
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 11
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 11
                  i32.load offset=4
                  i32.const 52
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 11
                  i32.load
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 10
              end
              local.get 3
              local.get 7
              i32.store offset=24
              local.get 3
              local.get 10
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.load offset=4
              call_indirect (type 4)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 6
              i32.const 32
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=32
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 5)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h50bbe99a2d64fc5cE (;204;) (type 2) (param i32 i32)
    local.get 0
    i64.const 5401495139214674892
    i64.store offset=8
    local.get 0
    i64.const 8005529906406067824
    i64.store
  )
  (func $_ZN4core5slice5index22slice_index_order_fail17h0c75fe71e7929cd1E (;205;) (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index25slice_index_order_fail_rt17h964369f417c36aeeE
    unreachable
  )
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0145289b4fa5693E (;206;) (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1055925
    i32.const 14
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
  )
  (func $_ZN4core4cell22panic_already_borrowed17h17ad173f4dec947aE (;207;) (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 1
    i32.store offset=16
    local.get 1
    i32.const 1055960
    i32.store offset=12
    local.get 1
    i64.const 1
    i64.store offset=24 align=4
    local.get 1
    i32.const 53
    i32.store offset=40
    local.get 1
    local.get 1
    i32.const 36
    i32.add
    i32.store offset=20
    local.get 1
    local.get 1
    i32.const 47
    i32.add
    i32.store offset=36
    local.get 1
    i32.const 12
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h389f87c8a9712d83E (;208;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 2
              i32.const 8
              i32.lt_u
              br_if 0 (;@5;)
              block ;; label = @6
                block ;; label = @7
                  local.get 1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.get 1
                  i32.sub
                  local.tee 3
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 4
                  loop ;; label = @8
                    local.get 1
                    local.get 4
                    i32.add
                    i32.load8_u
                    i32.eqz
                    br_if 5 (;@3;)
                    local.get 3
                    local.get 4
                    i32.const 1
                    i32.add
                    local.tee 4
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 3
                  local.get 2
                  i32.const -8
                  i32.add
                  local.tee 5
                  i32.le_u
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
                local.get 2
                i32.const -8
                i32.add
                local.set 5
              end
              loop ;; label = @6
                local.get 1
                local.get 3
                i32.add
                local.tee 4
                i32.const 4
                i32.add
                i32.load
                local.tee 6
                i32.const -16843009
                i32.add
                local.get 6
                i32.const -1
                i32.xor
                i32.and
                local.get 4
                i32.load
                local.tee 4
                i32.const -16843009
                i32.add
                local.get 4
                i32.const -1
                i32.xor
                i32.and
                i32.or
                i32.const -2139062144
                i32.and
                br_if 2 (;@4;)
                local.get 3
                i32.const 8
                i32.add
                local.tee 3
                local.get 5
                i32.le_u
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.eqz
            br_if 2 (;@2;)
            block ;; label = @5
              local.get 1
              i32.load8_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              br 2 (;@3;)
            end
            i32.const 1
            local.set 4
            local.get 2
            i32.const 1
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.load8_u offset=1
            i32.eqz
            br_if 1 (;@3;)
            i32.const 2
            local.set 4
            local.get 2
            i32.const 2
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.load8_u offset=2
            i32.eqz
            br_if 1 (;@3;)
            i32.const 3
            local.set 4
            local.get 2
            i32.const 3
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.load8_u offset=3
            i32.eqz
            br_if 1 (;@3;)
            i32.const 4
            local.set 4
            local.get 2
            i32.const 4
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.load8_u offset=4
            i32.eqz
            br_if 1 (;@3;)
            i32.const 5
            local.set 4
            local.get 2
            i32.const 5
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.load8_u offset=5
            i32.eqz
            br_if 1 (;@3;)
            i32.const 6
            local.set 4
            local.get 2
            i32.const 6
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.load8_u offset=6
            i32.eqz
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 3
          local.get 2
          i32.eq
          br_if 1 (;@2;)
          loop ;; label = @4
            block ;; label = @5
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              br_if 0 (;@5;)
              local.get 3
              local.set 4
              br 2 (;@3;)
            end
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 4
        i32.const 1
        i32.add
        local.get 2
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        local.get 4
        i32.store offset=8
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        i32.const 1
        i32.store
        return
      end
      local.get 0
      i32.const 1
      i32.store offset=4
      local.get 0
      i32.const 1
      i32.store
      return
    end
    local.get 0
    local.get 2
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store
  )
  (func $_ZN4core3str8converts9from_utf817ha5a496e5d6c22d13E (;209;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64 i64 i32)
    block ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      i32.const -7
      i32.add
      local.tee 3
      local.get 3
      local.get 2
      i32.gt_u
      select
      local.set 4
      local.get 1
      i32.const 3
      i32.add
      i32.const -4
      i32.and
      local.get 1
      i32.sub
      local.set 5
      i32.const 0
      local.set 3
      loop ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 1
                local.get 3
                i32.add
                i32.load8_u
                local.tee 6
                i32.extend8_s
                local.tee 7
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                local.get 5
                local.get 3
                i32.sub
                i32.const 3
                i32.and
                br_if 1 (;@5;)
                local.get 3
                local.get 4
                i32.ge_u
                br_if 2 (;@4;)
                loop ;; label = @7
                  local.get 1
                  local.get 3
                  i32.add
                  local.tee 6
                  i32.const 4
                  i32.add
                  i32.load
                  local.get 6
                  i32.load
                  i32.or
                  i32.const -2139062144
                  i32.and
                  br_if 3 (;@4;)
                  local.get 3
                  i32.const 8
                  i32.add
                  local.tee 3
                  local.get 4
                  i32.lt_u
                  br_if 0 (;@7;)
                  br 3 (;@4;)
                end
              end
              i64.const 1099511627776
              local.set 8
              i64.const 4294967296
              local.set 9
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 6
                                      i32.const 1056968
                                      i32.add
                                      i32.load8_u
                                      i32.const -2
                                      i32.add
                                      br_table 0 (;@17;) 1 (;@16;) 2 (;@15;) 10 (;@7;)
                                    end
                                    local.get 3
                                    i32.const 1
                                    i32.add
                                    local.tee 6
                                    local.get 2
                                    i32.lt_u
                                    br_if 2 (;@14;)
                                    i64.const 0
                                    local.set 8
                                    i64.const 0
                                    local.set 9
                                    br 9 (;@7;)
                                  end
                                  i64.const 0
                                  local.set 8
                                  local.get 3
                                  i32.const 1
                                  i32.add
                                  local.tee 10
                                  local.get 2
                                  i32.lt_u
                                  br_if 2 (;@13;)
                                  i64.const 0
                                  local.set 9
                                  br 8 (;@7;)
                                end
                                i64.const 0
                                local.set 8
                                local.get 3
                                i32.const 1
                                i32.add
                                local.tee 10
                                local.get 2
                                i32.lt_u
                                br_if 2 (;@12;)
                                i64.const 0
                                local.set 9
                                br 7 (;@7;)
                              end
                              i64.const 1099511627776
                              local.set 8
                              i64.const 4294967296
                              local.set 9
                              local.get 1
                              local.get 6
                              i32.add
                              i32.load8_s
                              i32.const -65
                              i32.gt_s
                              br_if 6 (;@7;)
                              br 7 (;@6;)
                            end
                            local.get 1
                            local.get 10
                            i32.add
                            i32.load8_s
                            local.set 10
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 6
                                  i32.const -224
                                  i32.add
                                  br_table 0 (;@15;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 2 (;@13;) 1 (;@14;) 2 (;@13;)
                                end
                                local.get 10
                                i32.const -32
                                i32.and
                                i32.const -96
                                i32.eq
                                br_if 4 (;@10;)
                                br 3 (;@11;)
                              end
                              local.get 10
                              i32.const -97
                              i32.gt_s
                              br_if 2 (;@11;)
                              br 3 (;@10;)
                            end
                            block ;; label = @13
                              local.get 7
                              i32.const 31
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 12
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 7
                              i32.const -2
                              i32.and
                              i32.const -18
                              i32.ne
                              br_if 2 (;@11;)
                              local.get 10
                              i32.const -64
                              i32.lt_s
                              br_if 3 (;@10;)
                              br 2 (;@11;)
                            end
                            local.get 10
                            i32.const -64
                            i32.lt_s
                            br_if 2 (;@10;)
                            br 1 (;@11;)
                          end
                          local.get 1
                          local.get 10
                          i32.add
                          i32.load8_s
                          local.set 10
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 6
                                  i32.const -240
                                  i32.add
                                  br_table 1 (;@14;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 2 (;@13;) 0 (;@15;)
                                end
                                local.get 7
                                i32.const 15
                                i32.add
                                i32.const 255
                                i32.and
                                i32.const 2
                                i32.gt_u
                                br_if 3 (;@11;)
                                local.get 10
                                i32.const -64
                                i32.ge_s
                                br_if 3 (;@11;)
                                br 2 (;@12;)
                              end
                              local.get 10
                              i32.const 112
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 48
                              i32.ge_u
                              br_if 2 (;@11;)
                              br 1 (;@12;)
                            end
                            local.get 10
                            i32.const -113
                            i32.gt_s
                            br_if 1 (;@11;)
                          end
                          block ;; label = @12
                            local.get 3
                            i32.const 2
                            i32.add
                            local.tee 6
                            local.get 2
                            i32.lt_u
                            br_if 0 (;@12;)
                            i64.const 0
                            local.set 9
                            br 5 (;@7;)
                          end
                          local.get 1
                          local.get 6
                          i32.add
                          i32.load8_s
                          i32.const -65
                          i32.gt_s
                          br_if 2 (;@9;)
                          i64.const 0
                          local.set 9
                          local.get 3
                          i32.const 3
                          i32.add
                          local.tee 6
                          local.get 2
                          i32.ge_u
                          br_if 4 (;@7;)
                          local.get 1
                          local.get 6
                          i32.add
                          i32.load8_s
                          i32.const -65
                          i32.le_s
                          br_if 5 (;@6;)
                          i64.const 3298534883328
                          local.set 8
                          br 3 (;@8;)
                        end
                        i64.const 1099511627776
                        local.set 8
                        br 2 (;@8;)
                      end
                      i64.const 0
                      local.set 9
                      local.get 3
                      i32.const 2
                      i32.add
                      local.tee 6
                      local.get 2
                      i32.ge_u
                      br_if 2 (;@7;)
                      local.get 1
                      local.get 6
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.le_s
                      br_if 3 (;@6;)
                    end
                    i64.const 2199023255552
                    local.set 8
                  end
                  i64.const 4294967296
                  local.set 9
                end
                local.get 0
                local.get 8
                local.get 3
                i64.extend_i32_u
                i64.or
                local.get 9
                i64.or
                i64.store offset=4 align=4
                local.get 0
                i32.const 1
                i32.store
                return
              end
              local.get 6
              i32.const 1
              i32.add
              local.set 3
              br 2 (;@3;)
            end
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          local.get 2
          i32.ge_u
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 1
            local.get 3
            i32.add
            i32.load8_s
            i32.const 0
            i32.lt_s
            br_if 1 (;@3;)
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 2
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store
  )
  (func $_ZN4core3fmt8builders11DebugStruct5field17h4fdf2486f159b581E (;210;) (type 12) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 1
    local.set 6
    block ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 7
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 8
        i32.load offset=28
        local.tee 9
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1056391
        i32.const 1056388
        local.get 7
        i32.const 255
        i32.and
        local.tee 7
        select
        i32.const 2
        i32.const 3
        local.get 7
        select
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1056340
        i32.const 2
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 3
        local.get 8
        local.get 4
        i32.load offset=12
        call_indirect (type 4)
        local.set 6
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 7
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1056393
        i32.const 3
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 8
        i32.load offset=28
        local.set 9
      end
      i32.const 1
      local.set 6
      local.get 5
      i32.const 1
      i32.store8 offset=27
      local.get 5
      local.get 8
      i64.load offset=20 align=4
      i64.store offset=12 align=4
      local.get 5
      i32.const 1056360
      i32.store offset=52
      local.get 5
      local.get 5
      i32.const 27
      i32.add
      i32.store offset=20
      local.get 5
      local.get 8
      i64.load offset=8 align=4
      i64.store offset=36 align=4
      local.get 8
      i64.load align=4
      local.set 10
      local.get 5
      local.get 9
      i32.store offset=56
      local.get 5
      local.get 8
      i32.load offset=16
      i32.store offset=44
      local.get 5
      local.get 8
      i32.load8_u offset=32
      i32.store8 offset=60
      local.get 5
      local.get 10
      i64.store offset=28 align=4
      local.get 5
      local.get 5
      i32.const 12
      i32.add
      i32.store offset=48
      local.get 5
      i32.const 12
      i32.add
      local.get 1
      local.get 2
      call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h5f83e220b7ba6699E
      br_if 0 (;@1;)
      local.get 5
      i32.const 12
      i32.add
      i32.const 1056340
      i32.const 2
      call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h5f83e220b7ba6699E
      br_if 0 (;@1;)
      local.get 3
      local.get 5
      i32.const 28
      i32.add
      local.get 4
      i32.load offset=12
      call_indirect (type 4)
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=48
      i32.const 1056396
      i32.const 2
      local.get 5
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 5)
      local.set 6
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 6
    i32.store8 offset=4
    local.get 5
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h694040502f01b637E (;211;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i64.load8_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h1fec4fd64e256c58E
  )
  (func $_ZN4core6result13unwrap_failed17h30d23efcc9e41efcE (;212;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 60
    i32.add
    i32.const 54
    i32.store
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1056344
    i32.store offset=24
    local.get 5
    i64.const 2
    i64.store offset=36 align=4
    local.get 5
    i32.const 55
    i32.store offset=52
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    local.get 5
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 5
    local.get 5
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core6option13unwrap_failed17h5cf22e6c8f50e086E (;213;) (type 1) (param i32)
    i32.const 1055978
    i32.const 43
    local.get 0
    call $_ZN4core9panicking5panic17h0d08f040be55464aE
    unreachable
  )
  (func $_ZN4core6option13expect_failed17hd052156a34080ddaE (;214;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking13panic_display17h49170cdca253a63dE
    unreachable
  )
  (func $_ZN4core9panicking13panic_display17h49170cdca253a63dE (;215;) (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 1055968
    i32.store
    local.get 2
    i64.const 1
    i64.store offset=12 align=4
    local.get 2
    i32.const 55
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 2
    local.get 1
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN70_$LT$core..panic..location..Location$u20$as$u20$core..fmt..Display$GT$3fmt17haee63deca0b34086E (;216;) (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 2
    i32.const 24
    i32.add
    i32.const 12
    i32.add
    i32.const 13
    i32.store
    local.get 2
    i32.const 3
    i32.store offset=4
    local.get 2
    i32.const 1056024
    i32.store
    local.get 2
    i64.const 3
    i64.store offset=12 align=4
    local.get 2
    i32.const 55
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=40
    local.get 2
    local.get 0
    i32.const 8
    i32.add
    i32.store offset=32
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 1
    i32.load offset=20
    local.get 1
    i32.load offset=24
    local.get 2
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
    local.set 0
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hade7e0fc76d4f99aE (;217;) (type 4) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17h9c96c844f75776beE
  )
  (func $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17h6d62b1b987e95170E (;218;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 1
    local.set 3
    block ;; label = @1
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.const 1056048
      i32.const 12
      local.get 1
      i32.load offset=24
      local.tee 5
      i32.load offset=12
      local.tee 6
      call_indirect (type 5)
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      local.set 1
      local.get 2
      i32.const 60
      i32.add
      i32.const 13
      i32.store
      local.get 2
      i32.const 40
      i32.add
      i32.const 12
      i32.add
      i32.const 13
      i32.store
      local.get 2
      i32.const 3
      i32.store offset=20
      local.get 2
      i32.const 1056024
      i32.store offset=16
      local.get 2
      i64.const 3
      i64.store offset=28 align=4
      local.get 2
      local.get 1
      i32.const 12
      i32.add
      i32.store offset=56
      local.get 2
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 2
      i32.const 55
      i32.store offset=44
      local.get 2
      local.get 1
      i32.store offset=40
      local.get 2
      local.get 2
      i32.const 40
      i32.add
      i32.store offset=24
      local.get 4
      local.get 5
      local.get 2
      i32.const 16
      i32.add
      call $_ZN4core3fmt5write17h5aa565b06adfe6beE
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load offset=8
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 1056060
          i32.const 2
          local.get 6
          call_indirect (type 5)
          br_if 2 (;@1;)
          local.get 2
          i32.const 40
          i32.add
          i32.const 16
          i32.add
          local.get 1
          i32.const 16
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          i32.const 40
          i32.add
          i32.const 8
          i32.add
          local.get 1
          i32.const 8
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          local.get 1
          i64.load align=4
          i64.store offset=40
          local.get 4
          local.get 5
          local.get 2
          i32.const 40
          i32.add
          call $_ZN4core3fmt5write17h5aa565b06adfe6beE
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 2
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        i32.load offset=4
        i32.const 12
        i32.add
        i32.load
        call_indirect (type 2)
        local.get 2
        i64.load
        i64.const -163230743173927068
        i64.ne
        br_if 0 (;@2;)
        local.get 2
        i64.load offset=8
        i64.const -4493808902380553279
        i64.ne
        br_if 0 (;@2;)
        local.get 4
        i32.const 1056060
        i32.const 2
        local.get 6
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.load
        local.get 1
        i32.load offset=4
        local.get 6
        call_indirect (type 5)
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $_ZN4core9panicking18panic_nounwind_fmt17hf5a5001f1ed7aacfE (;219;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 0
    i64.load align=4
    i64.store
    local.get 3
    local.get 1
    i32.store8 offset=45
    local.get 3
    i32.const 0
    i32.store8 offset=44
    local.get 3
    local.get 2
    i32.store offset=40
    local.get 3
    i32.const 1056064
    i32.store offset=32
    local.get 3
    i32.const 1055924
    i32.store offset=28
    local.get 3
    local.get 3
    i32.store offset=36
    local.get 3
    i32.const 28
    i32.add
    call $rust_begin_unwind
    unreachable
  )
  (func $_ZN4core9panicking14panic_nounwind17h3097dfdd0babd915E (;220;) (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i64.const 0
    i64.store offset=12 align=4
    local.get 2
    i32.const 1055924
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store
    local.get 2
    i32.const 0
    i32.const 1056112
    call $_ZN4core9panicking18panic_nounwind_fmt17hf5a5001f1ed7aacfE
    unreachable
  )
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17hdbf1a04c09c4883bE (;221;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 87
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1056436
      call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1056452
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h44f9cea6c08a1017E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core9panicking19assert_failed_inner17hcf1985c073eb6fd3E (;222;) (type 13) (param i32 i32 i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 2
    i32.store offset=12
    local.get 7
    local.get 1
    i32.store offset=8
    local.get 7
    local.get 4
    i32.store offset=20
    local.get 7
    local.get 3
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.const 255
            i32.and
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 7
          i32.const 1056196
          i32.store offset=24
          i32.const 2
          local.set 2
          br 2 (;@1;)
        end
        local.get 7
        i32.const 1056198
        i32.store offset=24
        i32.const 2
        local.set 2
        br 1 (;@1;)
      end
      local.get 7
      i32.const 1056200
      i32.store offset=24
      i32.const 7
      local.set 2
    end
    local.get 7
    local.get 2
    i32.store offset=28
    block ;; label = @1
      local.get 5
      i32.load
      br_if 0 (;@1;)
      local.get 7
      i32.const 76
      i32.add
      i32.const 54
      i32.store
      local.get 7
      i32.const 68
      i32.add
      i32.const 54
      i32.store
      local.get 7
      i32.const 3
      i32.store offset=92
      local.get 7
      i32.const 1056256
      i32.store offset=88
      local.get 7
      i64.const 3
      i64.store offset=100 align=4
      local.get 7
      i32.const 55
      i32.store offset=60
      local.get 7
      local.get 7
      i32.const 56
      i32.add
      i32.store offset=96
      local.get 7
      local.get 7
      i32.const 16
      i32.add
      i32.store offset=72
      local.get 7
      local.get 7
      i32.const 8
      i32.add
      i32.store offset=64
      local.get 7
      local.get 7
      i32.const 24
      i32.add
      i32.store offset=56
      local.get 7
      i32.const 88
      i32.add
      local.get 6
      call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
      unreachable
    end
    local.get 7
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 5
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 7
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 5
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 7
    local.get 5
    i64.load align=4
    i64.store offset=32
    local.get 7
    i32.const 84
    i32.add
    i32.const 54
    i32.store
    local.get 7
    i32.const 76
    i32.add
    i32.const 54
    i32.store
    local.get 7
    i32.const 68
    i32.add
    i32.const 56
    i32.store
    local.get 7
    i32.const 4
    i32.store offset=92
    local.get 7
    i32.const 1056308
    i32.store offset=88
    local.get 7
    i64.const 4
    i64.store offset=100 align=4
    local.get 7
    i32.const 55
    i32.store offset=60
    local.get 7
    local.get 7
    i32.const 56
    i32.add
    i32.store offset=96
    local.get 7
    local.get 7
    i32.const 16
    i32.add
    i32.store offset=80
    local.get 7
    local.get 7
    i32.const 8
    i32.add
    i32.store offset=72
    local.get 7
    local.get 7
    i32.const 32
    i32.add
    i32.store offset=64
    local.get 7
    local.get 7
    i32.const 24
    i32.add
    i32.store offset=56
    local.get 7
    i32.const 88
    i32.add
    local.get 6
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2f07699d30bf99e0E (;223;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 4)
  )
  (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hb1534cc30294e469E (;224;) (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    local.get 1
    i32.load offset=24
    local.get 0
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
  )
  (func $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h5f83e220b7ba6699E (;225;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    i32.const -1
    i32.add
    local.set 3
    local.get 0
    i32.load offset=4
    local.set 4
    local.get 0
    i32.load
    local.set 5
    local.get 0
    i32.load offset=8
    local.set 6
    i32.const 0
    local.set 7
    i32.const 0
    local.set 8
    loop ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 7
          local.get 2
          i32.gt_u
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 1
            local.get 7
            i32.add
            local.set 9
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 2
                  local.get 7
                  i32.sub
                  local.tee 10
                  i32.const 8
                  i32.lt_u
                  br_if 0 (;@7;)
                  block ;; label = @8
                    block ;; label = @9
                      local.get 9
                      i32.const 3
                      i32.add
                      i32.const -4
                      i32.and
                      local.tee 11
                      local.get 9
                      i32.sub
                      local.tee 12
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 0
                      loop ;; label = @10
                        local.get 9
                        local.get 0
                        i32.add
                        i32.load8_u
                        i32.const 10
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 12
                        local.get 0
                        i32.const 1
                        i32.add
                        local.tee 0
                        i32.ne
                        br_if 0 (;@10;)
                      end
                      local.get 12
                      local.get 10
                      i32.const -8
                      i32.add
                      local.tee 13
                      i32.le_u
                      br_if 1 (;@8;)
                      br 3 (;@6;)
                    end
                    local.get 10
                    i32.const -8
                    i32.add
                    local.set 13
                  end
                  loop ;; label = @8
                    local.get 11
                    i32.const 4
                    i32.add
                    i32.load
                    local.tee 0
                    i32.const 168430090
                    i32.xor
                    i32.const -16843009
                    i32.add
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.and
                    local.get 11
                    i32.load
                    local.tee 0
                    i32.const 168430090
                    i32.xor
                    i32.const -16843009
                    i32.add
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.and
                    i32.or
                    i32.const -2139062144
                    i32.and
                    br_if 2 (;@6;)
                    local.get 11
                    i32.const 8
                    i32.add
                    local.set 11
                    local.get 12
                    i32.const 8
                    i32.add
                    local.tee 12
                    local.get 13
                    i32.le_u
                    br_if 0 (;@8;)
                    br 2 (;@6;)
                  end
                end
                block ;; label = @7
                  local.get 2
                  local.get 7
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 2
                  local.set 7
                  br 4 (;@3;)
                end
                i32.const 0
                local.set 0
                loop ;; label = @7
                  local.get 9
                  local.get 0
                  i32.add
                  i32.load8_u
                  i32.const 10
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 10
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 7
                br 3 (;@3;)
              end
              block ;; label = @6
                local.get 10
                local.get 12
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.set 7
                br 3 (;@3;)
              end
              loop ;; label = @6
                block ;; label = @7
                  local.get 9
                  local.get 12
                  i32.add
                  i32.load8_u
                  i32.const 10
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 12
                  local.set 0
                  br 2 (;@5;)
                end
                local.get 10
                local.get 12
                i32.const 1
                i32.add
                local.tee 12
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 2
              local.set 7
              br 2 (;@3;)
            end
            local.get 0
            local.get 7
            i32.add
            local.tee 12
            i32.const 1
            i32.add
            local.set 7
            block ;; label = @5
              local.get 12
              local.get 2
              i32.ge_u
              br_if 0 (;@5;)
              local.get 9
              local.get 0
              i32.add
              i32.load8_u
              i32.const 10
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              local.get 7
              local.set 11
              local.get 7
              local.set 0
              br 3 (;@2;)
            end
            local.get 7
            local.get 2
            i32.le_u
            br_if 0 (;@4;)
          end
        end
        i32.const 1
        local.set 9
        local.get 8
        local.set 11
        local.get 2
        local.set 0
        local.get 8
        local.get 2
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      block ;; label = @2
        local.get 6
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.const 1056384
        i32.const 4
        local.get 4
        i32.load offset=12
        call_indirect (type 5)
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        return
      end
      local.get 0
      local.get 8
      i32.sub
      local.set 10
      i32.const 0
      local.set 12
      block ;; label = @2
        local.get 0
        local.get 8
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        i32.add
        i32.load8_u
        i32.const 10
        i32.eq
        local.set 12
      end
      local.get 1
      local.get 8
      i32.add
      local.set 0
      local.get 6
      local.get 12
      i32.store8
      local.get 11
      local.set 8
      local.get 5
      local.get 0
      local.get 10
      local.get 4
      i32.load offset=12
      call_indirect (type 5)
      local.tee 0
      local.get 9
      i32.or
      i32.eqz
      br_if 0 (;@1;)
    end
    local.get 0
  )
  (func $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17he424d61d0fec745fE (;226;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    block ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 1056384
      i32.const 4
      local.get 2
      i32.load offset=12
      call_indirect (type 5)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    local.get 0
    local.get 1
    i32.const 10
    i32.eq
    i32.store8
    local.get 3
    local.get 1
    local.get 2
    i32.load offset=16
    call_indirect (type 4)
  )
  (func $_ZN4core3fmt8builders10DebugTuple5field17h677f433dd7b7d844E (;227;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 4
    i32.const 1
    local.set 5
    block ;; label = @1
      local.get 0
      i32.load8_u offset=8
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 6
        i32.load offset=28
        local.tee 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 5
        local.get 6
        i32.load offset=20
        i32.const 1056391
        i32.const 1056401
        local.get 4
        select
        i32.const 2
        i32.const 1
        local.get 4
        select
        local.get 6
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 1
        local.get 6
        local.get 2
        i32.load offset=12
        call_indirect (type 4)
        local.set 5
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        i32.const 1
        local.set 5
        local.get 6
        i32.load offset=20
        i32.const 1056402
        i32.const 2
        local.get 6
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 6
        i32.load offset=28
        local.set 7
      end
      i32.const 1
      local.set 5
      local.get 3
      i32.const 1
      i32.store8 offset=27
      local.get 3
      local.get 6
      i64.load offset=20 align=4
      i64.store offset=12 align=4
      local.get 3
      i32.const 1056360
      i32.store offset=52
      local.get 3
      local.get 3
      i32.const 27
      i32.add
      i32.store offset=20
      local.get 3
      local.get 6
      i64.load offset=8 align=4
      i64.store offset=36 align=4
      local.get 6
      i64.load align=4
      local.set 8
      local.get 3
      local.get 7
      i32.store offset=56
      local.get 3
      local.get 6
      i32.load offset=16
      i32.store offset=44
      local.get 3
      local.get 6
      i32.load8_u offset=32
      i32.store8 offset=60
      local.get 3
      local.get 8
      i64.store offset=28 align=4
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      i32.store offset=48
      local.get 1
      local.get 3
      i32.const 28
      i32.add
      local.get 2
      i32.load offset=12
      call_indirect (type 4)
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=48
      i32.const 1056396
      i32.const 2
      local.get 3
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 5)
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store8 offset=8
    local.get 0
    local.get 4
    i32.const 1
    i32.add
    i32.store
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt8builders8DebugSet5entry17h51397cc4d550b533E (;228;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 1
    local.set 4
    block ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load
          local.tee 5
          i32.load offset=28
          local.tee 6
          i32.const 4
          i32.and
          br_if 0 (;@3;)
          local.get 4
          i32.const 255
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=20
          i32.const 1056391
          i32.const 2
          local.get 5
          i32.load offset=24
          i32.load offset=12
          call_indirect (type 5)
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=20
          i32.const 1056405
          i32.const 1
          local.get 5
          i32.load offset=24
          i32.load offset=12
          call_indirect (type 5)
          br_if 2 (;@1;)
          local.get 5
          i32.load offset=28
          local.set 6
        end
        i32.const 1
        local.set 4
        local.get 3
        i32.const 1
        i32.store8 offset=27
        local.get 3
        local.get 5
        i64.load offset=20 align=4
        i64.store offset=12 align=4
        local.get 3
        i32.const 1056360
        i32.store offset=52
        local.get 3
        local.get 3
        i32.const 27
        i32.add
        i32.store offset=20
        local.get 3
        local.get 5
        i64.load offset=8 align=4
        i64.store offset=36 align=4
        local.get 5
        i64.load align=4
        local.set 7
        local.get 3
        local.get 6
        i32.store offset=56
        local.get 3
        local.get 5
        i32.load offset=16
        i32.store offset=44
        local.get 3
        local.get 5
        i32.load8_u offset=32
        i32.store8 offset=60
        local.get 3
        local.get 7
        i64.store offset=28 align=4
        local.get 3
        local.get 3
        i32.const 12
        i32.add
        i32.store offset=48
        local.get 1
        local.get 3
        i32.const 28
        i32.add
        local.get 2
        i32.load offset=12
        call_indirect (type 4)
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=48
        i32.const 1056396
        i32.const 2
        local.get 3
        i32.load offset=52
        i32.load offset=12
        call_indirect (type 5)
        local.set 4
        br 1 (;@1;)
      end
      local.get 1
      local.get 5
      local.get 2
      i32.load offset=12
      call_indirect (type 4)
      local.set 4
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 4
    i32.store8 offset=4
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt8builders9DebugList6finish17h5a95446ce01a0998E (;229;) (type 3) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    block ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=20
      i32.const 1056406
      i32.const 1
      local.get 0
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 5)
      local.set 1
    end
    local.get 1
  )
  (func $_ZN4core3fmt9Formatter12pad_integral17h44f9cea6c08a1017E (;230;) (type 14) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load offset=28
        local.set 7
        i32.const 45
        local.set 8
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=28
      local.tee 7
      i32.const 1
      i32.and
      local.tee 1
      select
      local.set 8
      local.get 1
      local.get 5
      i32.add
      local.set 6
    end
    block ;; label = @1
      block ;; label = @2
        local.get 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $_ZN4core3str5count14do_count_chars17h880d99e06b2a5187E
          local.set 1
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 9
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 10
            br 1 (;@3;)
          end
          local.get 3
          i32.const 12
          i32.and
          local.set 11
          i32.const 0
          local.set 1
          i32.const 0
          local.set 10
          loop ;; label = @4
            local.get 1
            local.get 2
            local.get 10
            i32.add
            local.tee 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 11
            local.get 10
            i32.const 4
            i32.add
            local.tee 10
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 10
        i32.add
        local.set 12
        loop ;; label = @3
          local.get 1
          local.get 12
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 1
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 6
      i32.add
      local.set 6
    end
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h42e7d10e5491e0ccE
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      block ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 9
        local.get 6
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h42e7d10e5491e0ccE
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      block ;; label = @2
        local.get 7
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 11
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 7
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h42e7d10e5491e0ccE
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.sub
        i32.const 1
        i32.add
        local.set 1
        block ;; label = @3
          loop ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 12
            i32.const 48
            local.get 10
            i32.load offset=16
            call_indirect (type 4)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 1
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 0
        local.get 7
        i32.store8 offset=32
        local.get 0
        local.get 11
        i32.store offset=16
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 9
      local.get 6
      i32.sub
      local.set 6
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 6
          local.set 1
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 6
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 6
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 6
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.load offset=16
      local.set 9
      local.get 0
      i32.load offset=24
      local.set 12
      local.get 0
      i32.load offset=20
      local.set 10
      block ;; label = @2
        loop ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 10
          local.get 9
          local.get 12
          i32.load offset=16
          call_indirect (type 4)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 10
      local.get 12
      local.get 8
      local.get 2
      local.get 3
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h42e7d10e5491e0ccE
      br_if 0 (;@1;)
      local.get 10
      local.get 4
      local.get 5
      local.get 12
      i32.load offset=12
      call_indirect (type 5)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop ;; label = @2
        block ;; label = @3
          local.get 6
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 6
          local.get 6
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 10
        local.get 9
        local.get 12
        i32.load offset=16
        call_indirect (type 4)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 6
      i32.lt_u
      return
    end
    local.get 1
  )
  (func $_ZN4core3fmt5Write9write_fmt17hc4e5fb52dc5095c0E (;231;) (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.const 1056360
    local.get 1
    call $_ZN4core3fmt5write17h5aa565b06adfe6beE
  )
  (func $_ZN4core3str5count14do_count_chars17h880d99e06b2a5187E (;232;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 1
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 1
        block ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          local.tee 7
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block ;; label = @4
            block ;; label = @5
              local.get 0
              local.get 2
              i32.sub
              local.tee 8
              i32.const -4
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              br 1 (;@4;)
            end
            i32.const 0
            local.set 9
            loop ;; label = @5
              local.get 1
              local.get 0
              local.get 9
              i32.add
              local.tee 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 9
              i32.const 4
              i32.add
              local.tee 9
              br_if 0 (;@5;)
            end
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 9
          i32.add
          local.set 2
          loop ;; label = @4
            local.get 1
            local.get 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 8
            i32.const 1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 9
        block ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.const -4
          i32.and
          i32.add
          local.tee 2
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 6
          local.get 5
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
          local.get 5
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 2
        i32.shr_u
        local.set 3
        local.get 6
        local.get 1
        i32.add
        local.set 8
        loop ;; label = @3
          local.get 9
          local.set 4
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 192
          local.get 3
          i32.const 192
          i32.lt_u
          select
          local.tee 6
          i32.const 3
          i32.and
          local.set 7
          local.get 6
          i32.const 2
          i32.shl
          local.set 5
          i32.const 0
          local.set 2
          block ;; label = @4
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.const 1008
            i32.and
            i32.add
            local.set 0
            i32.const 0
            local.set 2
            local.get 4
            local.set 1
            loop ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load offset=8
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load offset=4
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 2
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 2
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 6
          i32.sub
          local.set 3
          local.get 4
          local.get 5
          i32.add
          local.set 9
          local.get 2
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 2
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 8
          i32.add
          local.set 8
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 4
        local.get 6
        i32.const 252
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee 2
        i32.load
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 7
        i32.shr_u
        local.get 1
        i32.const 6
        i32.shr_u
        i32.or
        i32.const 16843009
        i32.and
        local.set 1
        block ;; label = @3
          local.get 7
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 9
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 9
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 7
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 2
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 8
        i32.add
        return
      end
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 9
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          i32.const 0
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.and
        local.set 3
        i32.const 0
        local.set 8
        i32.const 0
        local.set 2
        loop ;; label = @3
          local.get 8
          local.get 0
          local.get 2
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 3
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 9
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.set 1
      loop ;; label = @2
        local.get 8
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 9
        i32.const -1
        i32.add
        local.tee 9
        br_if 0 (;@2;)
      end
    end
    local.get 8
  )
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h42e7d10e5491e0ccE (;233;) (type 12) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 4)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 5)
  )
  (func $_ZN4core3fmt9Formatter9write_str17hf69c1071e35879f4E (;234;) (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
  )
  (func $_ZN4core3fmt9Formatter26debug_struct_field2_finish17he716caf3601ab937E (;235;) (type 15) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 11
    global.set $__stack_pointer
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
    local.set 2
    local.get 11
    i32.const 0
    i32.store8 offset=13
    local.get 11
    local.get 2
    i32.store8 offset=12
    local.get 11
    local.get 0
    i32.store offset=8
    local.get 11
    i32.const 8
    i32.add
    local.get 3
    local.get 4
    local.get 5
    local.get 6
    call $_ZN4core3fmt8builders11DebugStruct5field17h4fdf2486f159b581E
    local.get 7
    local.get 8
    local.get 9
    local.get 10
    call $_ZN4core3fmt8builders11DebugStruct5field17h4fdf2486f159b581E
    local.set 1
    local.get 11
    i32.load8_u offset=12
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 11
        i32.load8_u offset=13
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 1
        i32.load
        local.tee 0
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        i32.const 1056399
        i32.const 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=20
      i32.const 1056398
      i32.const 1
      local.get 0
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 5)
      local.set 0
    end
    local.get 11
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17ha586373309166b49E (;236;) (type 12) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
    i32.store8 offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 2
    i32.eqz
    i32.store8 offset=13
    local.get 5
    i32.const 0
    i32.store offset=4
    local.get 5
    i32.const 4
    i32.add
    local.get 3
    local.get 4
    call $_ZN4core3fmt8builders10DebugTuple5field17h677f433dd7b7d844E
    local.set 0
    local.get 5
    i32.load8_u offset=12
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=8
      local.set 2
      block ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        i32.load8_u offset=13
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 2
        i32.load offset=20
        i32.const 1056404
        i32.const 1
        local.get 2
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=20
      i32.const 1055924
      i32.const 1
      local.get 2
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 5)
      local.set 0
    end
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt9Formatter25debug_tuple_field2_finish17heaf853358da232e5E (;237;) (type 16) (param i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
    i32.store8 offset=12
    local.get 7
    local.get 0
    i32.store offset=8
    local.get 7
    local.get 2
    i32.eqz
    i32.store8 offset=13
    local.get 7
    i32.const 0
    i32.store offset=4
    local.get 7
    i32.const 4
    i32.add
    local.get 3
    local.get 4
    call $_ZN4core3fmt8builders10DebugTuple5field17h677f433dd7b7d844E
    local.get 5
    local.get 6
    call $_ZN4core3fmt8builders10DebugTuple5field17h677f433dd7b7d844E
    local.set 0
    local.get 7
    i32.load8_u offset=12
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 7
      i32.load offset=8
      local.set 2
      block ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 7
        i32.load8_u offset=13
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 2
        i32.load offset=20
        i32.const 1056404
        i32.const 1
        local.get 2
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=20
      i32.const 1055924
      i32.const 1
      local.get 2
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 5)
      local.set 0
    end
    local.get 7
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt9Formatter10debug_list17h0388f2b8b8bc3ac8E (;238;) (type 2) (param i32 i32)
    (local i32)
    local.get 1
    i32.load offset=20
    i32.const 1055977
    i32.const 1
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5)
    local.set 2
    local.get 0
    i32.const 0
    i32.store8 offset=5
    local.get 0
    local.get 2
    i32.store8 offset=4
    local.get 0
    local.get 1
    i32.store
  )
  (func $_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17h8449c20555d5b516E (;239;) (type 4) (param i32 i32) (result i32)
    block ;; label = @1
      local.get 0
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1056654
      i32.const 5
      call $_ZN4core3fmt9Formatter3pad17h9c96c844f75776beE
      return
    end
    local.get 1
    i32.const 1056659
    i32.const 4
    call $_ZN4core3fmt9Formatter3pad17h9c96c844f75776beE
  )
  (func $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0eca663ca1c2f482E (;240;) (type 5) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_ZN4core3fmt9Formatter3pad17h9c96c844f75776beE
  )
  (func $_ZN4core5slice6memchr14memchr_aligned17h72583c77567a47aaE (;241;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.tee 4
            local.get 2
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.sub
            local.tee 4
            local.get 3
            local.get 4
            local.get 3
            i32.lt_u
            select
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 6
            i32.const 1
            local.set 7
            loop ;; label = @5
              local.get 2
              local.get 5
              i32.add
              i32.load8_u
              local.get 6
              i32.eq
              br_if 4 (;@1;)
              local.get 4
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 4
            local.get 3
            i32.const -8
            i32.add
            local.tee 7
            i32.gt_u
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          local.get 3
          i32.const -8
          i32.add
          local.set 7
          i32.const 0
          local.set 4
        end
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 5
        loop ;; label = @3
          local.get 2
          local.get 4
          i32.add
          local.tee 6
          i32.const 4
          i32.add
          i32.load
          local.get 5
          i32.xor
          local.tee 8
          i32.const -16843009
          i32.add
          local.get 8
          i32.const -1
          i32.xor
          i32.and
          local.get 6
          i32.load
          local.get 5
          i32.xor
          local.tee 6
          i32.const -16843009
          i32.add
          local.get 6
          i32.const -1
          i32.xor
          i32.and
          i32.or
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 4
          i32.const 8
          i32.add
          local.tee 4
          local.get 7
          i32.le_u
          br_if 0 (;@3;)
        end
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 3
            local.get 4
            i32.sub
            local.tee 6
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            br 1 (;@3;)
          end
          local.get 2
          local.get 4
          i32.add
          local.set 8
          i32.const 0
          local.set 5
          local.get 1
          i32.const 255
          i32.and
          local.set 2
          i32.const 1
          local.set 7
          loop ;; label = @4
            block ;; label = @5
              local.get 8
              local.get 5
              i32.add
              i32.load8_u
              local.get 2
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              local.set 6
              br 3 (;@2;)
            end
            local.get 6
            local.get 5
            i32.const 1
            i32.add
            local.tee 5
            i32.ne
            br_if 0 (;@4;)
          end
        end
        i32.const 0
        local.set 7
      end
      local.get 6
      local.get 4
      i32.add
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store
  )
  (func $_ZN4core5slice6memchr7memrchr17h5e445b4a086eabe1E (;242;) (type 11) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 3
    i32.const 0
    local.get 3
    local.get 2
    i32.const 3
    i32.add
    i32.const -4
    i32.and
    local.get 2
    i32.sub
    local.tee 4
    i32.sub
    i32.const 7
    i32.and
    local.get 3
    local.get 4
    i32.lt_u
    select
    local.tee 5
    i32.sub
    local.set 6
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 3
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.add
              local.tee 5
              local.get 2
              local.get 6
              i32.add
              local.tee 7
              i32.sub
              local.set 8
              block ;; label = @6
                block ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -1
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block ;; label = @7
                  local.get 5
                  i32.const -2
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -2
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block ;; label = @7
                  local.get 5
                  i32.const -3
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -3
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block ;; label = @7
                  local.get 5
                  i32.const -4
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -4
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block ;; label = @7
                  local.get 5
                  i32.const -5
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -5
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block ;; label = @7
                  local.get 5
                  i32.const -6
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -6
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block ;; label = @7
                  local.get 5
                  i32.const -7
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -7
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                local.get 8
                i32.const -8
                i32.add
                local.set 4
              end
              local.get 4
              local.get 6
              i32.add
              local.set 4
              br 3 (;@2;)
            end
            local.get 4
            local.get 3
            local.get 3
            local.get 4
            i32.gt_u
            select
            local.set 9
            local.get 1
            i32.const 255
            i32.and
            i32.const 16843009
            i32.mul
            local.set 5
            block ;; label = @5
              loop ;; label = @6
                local.get 6
                local.tee 4
                local.get 9
                i32.le_u
                br_if 1 (;@5;)
                local.get 4
                i32.const -8
                i32.add
                local.set 6
                local.get 2
                local.get 4
                i32.add
                local.tee 8
                i32.const -4
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 7
                i32.const -16843009
                i32.add
                local.get 7
                i32.const -1
                i32.xor
                i32.and
                local.get 8
                i32.const -8
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 8
                i32.const -16843009
                i32.add
                local.get 8
                i32.const -1
                i32.xor
                i32.and
                i32.or
                i32.const -2139062144
                i32.and
                i32.eqz
                br_if 0 (;@6;)
              end
            end
            local.get 4
            local.get 3
            i32.gt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const -1
            i32.add
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 8
            loop ;; label = @5
              block ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 5 (;@1;)
              end
              local.get 5
              local.get 4
              i32.add
              local.set 6
              local.get 4
              i32.const -1
              i32.add
              local.set 4
              local.get 6
              i32.load8_u
              local.get 8
              i32.eq
              br_if 3 (;@2;)
              br 0 (;@5;)
            end
          end
          local.get 6
          local.get 3
          i32.const 1056696
          call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
          unreachable
        end
        local.get 4
        local.get 3
        i32.const 1056712
        call $_ZN4core5slice5index24slice_end_index_len_fail17hce3eead0bdad09ffE
        unreachable
      end
      i32.const 1
      local.set 6
    end
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 6
    i32.store
  )
  (func $_ZN4core5slice5index29slice_start_index_len_fail_rt17hb3fc619a6189ac16E (;243;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1056780
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core5slice5index27slice_end_index_len_fail_rt17hd4aaabdb4dcf49d2E (;244;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1056812
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core5slice5index25slice_index_order_fail_rt17h964369f417c36aeeE (;245;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1056864
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17h9ea147792981dd6eE (;246;) (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i32.const 3
    i32.store offset=12
    local.get 3
    i32.const 1056944
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.store offset=40
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17hdb62f5cdb45533e4E
    unreachable
  )
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17h54211fc08dfefdf6E (;247;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 55
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 255
      i32.and
      local.tee 4
      i32.const 4
      i32.shr_u
      local.set 3
      local.get 4
      i32.const 16
      i32.ge_u
      br_if 0 (;@1;)
    end
    block ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1056436
      call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1056452
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h44f9cea6c08a1017E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17hdc93e5d12c9eacc2E (;248;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 87
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 255
      i32.and
      local.tee 4
      i32.const 4
      i32.shr_u
      local.set 3
      local.get 4
      i32.const 16
      i32.ge_u
      br_if 0 (;@1;)
    end
    block ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1056436
      call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1056452
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h44f9cea6c08a1017E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt3num3imp7fmt_u6417h1fec4fd64e256c58E (;249;) (type 17) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 39
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1056454
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1056454
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1056454
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block ;; label = @1
      block ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1056454
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1055924
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h44f9cea6c08a1017E
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h086f04df513217ceE (;250;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 55
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1056436
      call $_ZN4core5slice5index26slice_start_index_len_fail17hb07266bf24f1850bE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1056452
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h44f9cea6c08a1017E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h3843c6091b6e0c6fE (;251;) (type 4) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 2
    i32.xor
    local.get 2
    i32.sub
    i64.extend_i32_u
    local.get 0
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h1fec4fd64e256c58E
  )
  (table (;0;) 63 63 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "__main_void" (func $__main_void))
  (export "alloc" (func $alloc))
  (export "dealloc" (func $dealloc))
  (export "copy" (func $copy))
  (export "create_closure" (func $create_closure))
  (export "test_write" (func $test_write))
  (export "test_read" (func $test_read))
  (export "main" (func $main))
  (elem (;0;) (i32.const 1) func $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h694040502f01b637E $main $_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h17d4e97ed95a929bE $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h339466471c0055a2E $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h03763b9857f67c1dE $_ZN3std2io5Write9write_fmt17h76571f83421c996cE $_ZN3std2io5Write9write_fmt17h5247b54d580309d5E $_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e4bd7f75938ee9E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h3843c6091b6e0c6fE $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hb471c0e409086755E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6eea59c5fd9dd22cE $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17h929aeea2aebd3221E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h3921da4b80c91f1dE $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5e016345119d42cdE $_ZN91_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h68f72991cc0e9004E $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17h6d62b1b987e95170E $_ZN3std5alloc24default_alloc_error_hook17h026737e940a258acE $_ZN4core3ptr122drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Sync$u2b$core..marker..Send$GT$$GT$17hbf49eedcf28d454fE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2b3819cd6e06b9c4E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha0a2ff7e524e7ae6E $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h2070fb1ae8c0636dE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hd29c5c030bcac8cfE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h8e49938832ba616eE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hac9e9a6579d887b2E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h765799883bb3e57aE $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h829402613431a284E $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h033331596459965eE $_ZN4core3fmt5Write10write_char17hdb273777cacb033eE $_ZN4core3fmt5Write9write_fmt17h99189ac71df186ceE $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha8e6296570c371c7E $_ZN4core3fmt5Write10write_char17h71a5231a37b379deE $_ZN4core3fmt5Write9write_fmt17hbed4979c13640f0dE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h70e6654b85a086f1E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h57abe73182e9415aE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17he1a8499bb7979c0aE $_ZN4core3fmt5Write9write_fmt17hac1e0a44787515a2E $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hf36efb2c172acdd0E $_ZN4core3fmt5Write10write_char17h6ec79911d954a2e3E $_ZN4core3fmt5Write9write_fmt17h5d70bc4ebce664bcE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdd99a549e346a7e9E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h103b3b85354afb20E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h900ee2d39eee4b2aE $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17hc4aeff84f978920fE $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h9f6cb9c148c6a40aE $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17haafd4c195e8cf7f1E $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h998c083b631e1261E $_ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17haa3bd0e8b9350184E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf075f550b029b4fE $_ZN64_$LT$core..str..error..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h8579cca2b823a577E $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h285a282621bac8daE $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17hb8eb2859becdc12aE $_ZN4core3ops8function6FnOnce9call_once17h9bac24e69c91fbc4E $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0145289b4fa5693E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2f07699d30bf99e0E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hade7e0fc76d4f99aE $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hb1534cc30294e469E $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h4d68abdeed11fa95E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h50bbe99a2d64fc5cE $_ZN4core3ptr25drop_in_place$LT$char$GT$17h2adcaa2036c619b6E $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h5f83e220b7ba6699E $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17he424d61d0fec745fE $_ZN4core3fmt5Write9write_fmt17hc4e5fb52dc5095c0E)
  (data $.rodata (;0;) (i32.const 1048576) "unsafe precondition(s) violated: slice::get_unchecked_mut requires that the range is within the slice\00\00\00\03\00\00\00\04\00\00\00\04\00\00\00\04\00\00\00\05\00\00\00\05\00\00\00is_nonoverlapping: `size_of::<T>() * count` overflows a usizeunsafe precondition(s) violated: ptr::copy_nonoverlapping requires that both pointer arguments are aligned and non-null and the specified memory ranges do not overlapis_aligned_to: align is not a power-of-two\00\00\00c\01\10\00*\00\00\00\00\00\00\00\00\00\00\00/rustc/9b00956e56009bab2aa15d7bff10916599e3d6d6/library/core/src/ptr/const_ptr.rs\00\00\00\a0\01\10\00Q\00\00\00b\06\00\00\0d\00\00\00invalid args\04\02\10\00\0c\00\00\00/rustc/9b00956e56009bab2aa15d7bff10916599e3d6d6/library/core/src/fmt/mod.rs\00\18\02\10\00K\00\00\00U\01\00\00\0d\00\00\00unsafe precondition(s) violated: ptr::read_volatile requires that the pointer argument is aligned and non-nullunsafe precondition(s) violated: NonNull::new_unchecked requires that the pointer is non-null/rustc/9b00956e56009bab2aa15d7bff10916599e3d6d6/library/core/src/alloc/layout.rs\00?\03\10\00P\00\00\00\c1\01\00\00)\00\00\00attempt to divide by zero/rustc/9b00956e56009bab2aa15d7bff10916599e3d6d6/library/core/src/intrinsics.rs\00\b9\03\10\00N\00\00\00\0a\0b\00\006\00\00\00unsafe precondition(s) violated: slice::from_raw_parts requires the pointer to be aligned and non-null, and the total size of the slice not to exceed `isize::MAX`unsafe precondition(s) violated: slice::from_raw_parts_mut requires the pointer to be aligned and non-null, and the total size of the slice not to exceed `isize::MAX`wasm_code/linking/lib.rs`\05\10\00\18\00\00\00\16\00\00\00\0d\00\00\00`\05\10\00\18\00\00\00 \00\00\00\0c\00\00\00`\05\10\00\18\00\00\00 \00\00\00\13\00\00\00`\05\10\00\18\00\00\00!\00\00\00\0c\00\00\00`\05\10\00\18\00\00\00!\00\00\00\13\00\00\00`\05\10\00\18\00\00\00.\00\00\00\0d\00\00\00\0a\00\00\00\98\01\10\00\00\00\00\00\d8\05\10\00\01\00\00\00`\05\10\00\18\00\00\00/\00\00\00\1c\00\00\00()\00\00\12\00\00\00\04\00\00\00\04\00\00\00\13\00\00\00reentrant init\00\00\10\06\10\00\0e\00\00\00/rustc/9b00956e56009bab2aa15d7bff10916599e3d6d6/library/core/src/cell/once.rs\00\00\00(\06\10\00M\00\00\00\d9\00\00\00B\00\00\00\00\00\00\00\12\00\00\00\04\00\00\00\04\00\00\00\14\00\00\00internal error: entered unreachable code/rustc/9b00956e56009bab2aa15d7bff10916599e3d6d6/library/alloc/src/vec/mod.rs\c4\06\10\00L\00\00\00`\08\00\00$\00\00\00NulError\12\00\00\00\04\00\00\00\04\00\00\00\15\00\00\00\12\00\00\00\04\00\00\00\04\00\00\00\16\00\00\00Utf8Errorvalid_up_toerror_len\00\00\00\12\00\00\00\04\00\00\00\04\00\00\00\17\00\00\00NoneSomeOk\00\00\12\00\00\00\04\00\00\00\04\00\00\00\18\00\00\00Err\00\12\00\00\00\04\00\00\00\04\00\00\00\19\00\00\00\1a\00\00\00\0c\00\00\00\04\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00\1a\00\00\00\0c\00\00\00\04\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00!\00\00\00\0c\00\00\00\04\00\00\00\22\00\00\00#\00\00\00$\00\00\00\1a\00\00\00\0c\00\00\00\04\00\00\00%\00\00\00&\00\00\00'\00\00\00mainfatal runtime error: unwrap failed: CString::new(\22main\22) = \0a\0c\08\10\00;\00\00\00G\08\10\00\01\00\00\00library/std/src/rt.rs\00\00\00X\08\10\00\15\00\00\00r\00\00\00\0d\00\00\00library/std/src/thread/mod.rsfailed to generate unique thread ID: bitspace exhausted\9d\08\10\007\00\00\00\80\08\10\00\1d\00\00\00\97\04\00\00\0d\00\00\00RUST_BACKTRACEcalled `Result::unwrap()` on an `Err` valuefailed to write the buffered data\00\00%\09\10\00!\00\00\00\17\00\00\00\00\06\10\00\00\00\00\00library/std/src/io/buffered/linewritershim.rsmid > len\00\00\89\09\10\00\09\00\00\00\5c\09\10\00-\00\00\00\0a\01\00\00)\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filefilesystem quota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryother erroruncategorized error (os error )\00\00\00\00\06\10\00\00\00\00\00\99\0c\10\00\0b\00\00\00\a4\0c\10\00\01\00\00\00library/std/src/io/stdio.rs\00\c0\0c\10\00\1b\00\00\00\a9\02\00\00\13\00\00\00\c0\0c\10\00\1b\00\00\00\22\03\00\00\14\00\00\00failed printing to : \00\00\00\fc\0c\10\00\13\00\00\00\0f\0d\10\00\02\00\00\00\c0\0c\10\00\1b\00\00\00@\04\00\00\09\00\00\00stdoutlibrary/std/src/io/mod.rsfailed to write whole buffer\00S\0d\10\00\1c\00\00\00\17\00\00\00:\0d\10\00\19\00\00\00\ae\06\00\00$\00\00\00formatter error\00\8c\0d\10\00\0f\00\00\00(\00\00\00library/std/src/panic.rs\a8\0d\10\00\18\00\00\00\f9\00\00\00\12\00\00\00fullcannot recursively acquire mutex\d4\0d\10\00 \00\00\00library/std/src/sys/sync/mutex/no_threads.rs\fc\0d\10\00,\00\00\00\14\00\00\00\09\00\00\00library/std/src/sync/once.rs8\0e\10\00\1c\00\00\00\95\00\00\002\00\00\008\0e\10\00\1c\00\00\00\d0\00\00\00\14\00\00\008\0e\10\00\1c\00\00\00\d0\00\00\001\00\00\00lock count overflow in reentrant mutexlibrary/std/src/sync/reentrant_lock.rs\aa\0e\10\00&\00\00\00\bc\00\00\00-\00\00\00file name contained an unexpected NUL byte\00\00\e0\0e\10\00*\00\00\00\14\00\00\00\02\00\00\00\0c\0f\10\00stack backtrace:\0anote: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.\0afatal runtime error: assertion failed: thread_info.stack_guard.get().is_none() && thread_info.thread.get().is_none()\0a\00\00\89\0f\10\00u\00\00\00memory allocation of  bytes failed\0a\00\08\10\10\00\15\00\00\00\1d\10\10\00\0e\00\00\00 bytes failed\00\00\00\08\10\10\00\15\00\00\00<\10\10\00\0d\00\00\00library/std/src/alloc.rs\5c\10\10\00\18\00\00\00b\01\00\00\09\00\00\00library/std/src/panicking.rsBox<dyn Any><unnamed>thread '' panicked at :\0a\00\00\00\b5\10\10\00\08\00\00\00\bd\10\10\00\0e\00\00\00\cb\10\10\00\02\00\00\00G\08\10\00\01\00\00\00note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace\0a\00\00\f0\10\10\00N\00\00\00\84\10\10\00\1c\00\00\00\84\02\00\00\1e\00\00\00!\00\00\00\0c\00\00\00\04\00\00\00(\00\00\00\12\00\00\00\08\00\00\00\04\00\00\00)\00\00\00\12\00\00\00\08\00\00\00\04\00\00\00*\00\00\00+\00\00\00,\00\00\00\10\00\00\00\04\00\00\00-\00\00\00.\00\00\00/\00\00\00\00\00\00\00\01\00\00\000\00\00\00\0apanicked after panic::always_abort(), aborting.\0a\00\00\00\00\06\10\00\00\00\00\00\b0\11\10\001\00\00\00thread panicked while processing panic. aborting.\0a\00\00\f4\11\10\002\00\00\00thread caused non-unwinding panic. aborting.\0a\00\00\000\12\10\00-\00\00\00fatal runtime error: failed to initiate panic, error \00\00\00h\12\10\005\00\00\00G\08\10\00\01\00\00\00\12\00\00\00\08\00\00\00\04\00\00\001\00\00\00library/std/src/sys/pal/wasi/os.rs\00\00\c0\12\10\00\22\00\00\00C\00\00\006\00\00\00strerror_r failure\00\00\f4\12\10\00\12\00\00\00\c0\12\10\00\22\00\00\00A\00\00\00\0d\00\00\00Once instance has previously been poisoned\00\00 \13\10\00*\00\00\00one-time initialization may not be performed recursivelyT\13\10\008\00\00\00fatal runtime error: rwlock locked for writing\0a\00\94\13\10\00/\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\19\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\13\00\00\00\ac\09\10\00\bc\09\10\00\cd\09\10\00\df\09\10\00\ef\09\10\00\ff\09\10\00\12\0a\10\00$\0a\10\001\0a\10\00?\0a\10\00T\0a\10\00`\0a\10\00k\0a\10\00\80\0a\10\00\95\0a\10\00\a4\0a\10\00\b2\0a\10\00\c5\0a\10\00\eb\0a\10\00#\0b\10\00<\0b\10\00S\0b\10\00_\0b\10\00h\0b\10\00r\0b\10\00\82\0b\10\00\99\0b\10\00\b2\0b\10\00\c0\0b\10\00\cd\0b\10\00\e1\0b\10\00\e9\0b\10\00\04\0c\10\00\12\0c\10\00\22\0c\10\008\0c\10\00M\0c\10\00X\0c\10\00n\0c\10\00{\0c\10\00\86\0c\10\00/\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00\00\00\00\00\00\00\00\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05\00\00LayoutErrorcapacity overflow\d7\1b\10\00\11\00\00\00library/alloc/src/raw_vec.rs\f0\1b\10\00\1c\00\00\00\19\00\00\00\05\00\00\00library/alloc/src/ffi/c_str.rs\00\00\1c\1c\10\00\1e\00\00\00\1d\01\00\007\00\00\00called `Result::unwrap()` on an `Err` value\002\00\00\00\00\00\00\00\01\00\00\003\00\00\00library/alloc/src/sync.rs\00\00\00\88\1c\10\00\19\00\00\00u\01\00\002\00\00\00)BorrowMutErroralready borrowed: \00\00\00\c3\1c\10\00\12\00\00\00\b4\1c\10\00\00\00\00\00:[called `Option::unwrap()` on a `None` value\00\00\00\b4\1c\10\00\00\00\00\00\e8\1c\10\00\01\00\00\00\e8\1c\10\00\01\00\00\00panicked at :\0a\00\009\00\00\00\00\00\00\00\01\00\00\00:\00\00\00library/core/src/panicking.rs\00\00\00P\1d\10\00\1d\00\00\00\9c\00\00\00\05\00\00\00index out of bounds: the len is  but the index is \00\00\80\1d\10\00 \00\00\00\a0\1d\10\00\12\00\00\00==!=matchesassertion `left  right` failed\0a  left: \0a right: \00\cf\1d\10\00\10\00\00\00\df\1d\10\00\17\00\00\00\f6\1d\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00\cf\1d\10\00\10\00\00\00\18\1e\10\00\10\00\00\00(\1e\10\00\09\00\00\00\f6\1d\10\00\09\00\00\00: \00\00\b4\1c\10\00\00\00\00\00T\1e\10\00\02\00\00\00;\00\00\00\0c\00\00\00\04\00\00\00<\00\00\00=\00\00\00>\00\00\00     { ,  {\0a,\0a} }((\0a,\0a]library/core/src/fmt/num.rs\00\00\97\1e\10\00\1b\00\00\00i\00\00\00\17\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899falsetruelibrary/core/src/slice/memchr.rs\00\97\1f\10\00 \00\00\00\83\00\00\00\1e\00\00\00\97\1f\10\00 \00\00\00\9f\00\00\00\09\00\00\00range start index  out of range for slice of length \d8\1f\10\00\12\00\00\00\ea\1f\10\00\22\00\00\00range end index \1c \10\00\10\00\00\00\ea\1f\10\00\22\00\00\00slice index starts at  but ends at \00< \10\00\16\00\00\00R \10\00\0d\00\00\00source slice length () does not match destination slice length (p \10\00\15\00\00\00\85 \10\00+\00\00\00\b4\1c\10\00\01\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00")
  (data $.data (;1;) (i32.const 1057224) "\01\00\00\00\ff\ff\ff\ff\14\15\10\00")
  (@custom ".debug_abbrev" (after data) "\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\04.\00n\0e\03\0e:\0b;\0b \0b\00\00\05.\00n\0e\03\0e:\0b;\05 \0b\00\00\06.\00\11\01\12\06@\181\13\00\00\07.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\08.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\09\1d\011\13U\17X\0bY\05W\0b\00\00\0a\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\0b\1d\011\13\11\01\12\06X\0bY\05W\0b\00\00\0c\1d\001\13\11\01\12\06X\0bY\05W\0b\00\00\0d\1d\011\13\11\01\12\06X\0bY\0bW\0b\00\00\0e.\01\11\01\12\06@\181\13\00\00\0f.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\10\1d\011\13U\17X\0bY\0bW\0b\00\00\11\1d\001\13U\17X\0bY\0bW\0b\00\00\12\1d\001\13U\17X\0bY\05W\0b\00\00\13.\00\11\01\12\06@\18n\0e\03\0e:\0b;\056\0b\87\01\19\00\00\14.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\15.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\16.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\17\1d\001\13\11\01\12\06X\0bY\05\00\00\18.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\19.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\1a.\00n\0e\03\0e:\0b;\0b?\19 \0b\00\00\1b.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\87\01\19\00\00\1c.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05\87\01\19\00\00\1d.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\87\01\19\00\00\1e.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b6\0b\00\00\1f.\00\11\01\12\06@\18\03\0e:\0b;\0b?\19\00\00 \1d\011\13\11\01\12\06X\0bY\0b\00\00!.\01\11\01\12\06@\18n\0e\03\0e:\0b;\056\0b\00\00\22.\00n\0e\03\0e:\0b;\056\0b \0b\00\00#\1d\001\13\11\01\12\06X\0bY\0b\00\00$.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05\87\01\19\00\00%.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\87\01\19\00\00&\1d\011\13U\17X\0bY\0b\00\00'.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\87\01\19\00\00(.\01\11\01\12\06@\18\03\0e:\0b;\0b?\19\87\01\19\00\00).\01\11\01\12\06@\18\03\0e:\0b;\05?\19\87\01\19\00\00*.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\87\01\19\00\00+.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\00\00,.\00\11\01\12\06@\18\03\0e:\0b;\05?\19\87\01\19\00\00-\1d\001\13U\17X\0bY\0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00\11\01\12\06@\18\03\0e:\0b;\0b?\19\00\00\04.\00n\0e\03\0e:\0b;\0b\87\01\19 \0b\00\00\05.\01\11\01\12\06@\18\03\0e:\0b;\0b?\19\00\00\06\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\04.\00n\0e\03\0e:\0b;\05 \0b\00\00\05.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\06\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\07.\00\11\01\12\06@\181\13\00\00\08.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\09.\00n\0e\03\0e:\0b;\0b?\19 \0b\00\00\0a.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\0b.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\0c.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\0d\1d\001\13U\17X\0bY\05W\0b\00\00\0e\1d\001\13\11\01\12\06X\0bY\05W\0b\00\00\0f.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00n\0e\03\0e:\0b;\05 \0b\00\00\04.\00n\0e\03\0e:\0b;\0b \0b\00\00\05.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\06\1d\011\13U\17X\0bY\0bW\0b\00\00\07\1d\011\13U\17X\0bY\05W\0b\00\00\08\1d\011\13\11\01\12\06X\0bY\0bW\0b\00\00\09\1d\001\13\11\01\12\06X\0bY\05W\0b\00\00\0a\1d\001\13U\17X\0bY\05W\0b\00\00\0b\1d\011\13\11\01\12\06X\0bY\05W\0b\00\00\0c\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\0d\1d\001\13U\17X\0bY\0bW\0b\00\00\0e.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\0f.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\10.\01\11\01\12\06@\18n\0e\03\0e:\0b;\056\0b\00\00\11.\01\11\01\12\06@\181\13\00\00\12.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\13.\00n\0e\03\0e:\0b;\0b?\19 \0b\00\00\14.\00\11\01\12\06@\181\13\00\00\15.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\16\1d\001\13\11\01\12\06X\0bY\0b\00\00\17.\00n\0e\03\0e:\0b;\056\0b \0b\00\00\18.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\19\1d\011\13\11\01\12\06X\0bY\0b\00\00\1a.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\1b.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\04.\00n\0e\03\0e:\0b;\0b \0b\00\00\05.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\06\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\07.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\08.\00n\0e\03\0e:\0b;\05 \0b\00\00\09.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\0a\1d\011\13\11\01\12\06X\0bY\05W\0b\00\00\0b\1d\011\13U\17X\0bY\05W\0b\00\00\0c\1d\001\13\11\01\12\06X\0bY\05W\0b\00\00\0d.\01\11\01\12\06@\181\13\00\00\0e.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\0f.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\10\1d\001\13U\17X\0bY\05W\0b\00\00\11.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\87\01\19\00\00\12\1d\011\13\11\01\12\06X\0bY\0bW\0b\00\00\13.\00n\0e\03\0e:\0b;\05\87\01\19 \0b\00\00\14.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\87\01\19\00\00\15.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\87\01\19\00\00\16\1d\001\13U\17X\0bY\0bW\0b\00\00\17.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\18\1d\011\13U\17X\0bY\0bW\0b\00\00\19.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\1a.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00n\0e\03\0e:\0b;\05 \0b\00\00\04.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\05.\00n\0e\03\0e:\0b;\0b \0b\00\00\06.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\07\1d\011\13\11\01\12\06X\0bY\0bW\0b\00\00\08\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\09\1d\001\13U\17X\0bY\05W\0b\00\00\0a.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\0b.\00\11\01\12\06@\181\13\00\00\0c.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\0d\1d\001\13\11\01\12\06X\0bY\05W\0b\00\00\0e\1d\011\13\11\01\12\06X\0bY\05W\0b\00\00\0f\1d\011\13U\17X\0bY\0bW\0b\00\00\10\1d\001\13U\17X\0bY\0bW\0b\00\00\11\1d\011\13U\17X\0bY\05W\0b\00\00\12.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05\00\00\13.\01\11\01\12\06@\181\13\00\00\14.\00n\0e\03\0e:\0b;\0b?\19 \0b\00\00\15.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\00\00\16.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\17\1d\001\13\11\01\12\06X\0bY\0b\00\00\18.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\00\00\19\1d\011\13U\17X\0bY\0b\00\00\1a.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\87\01\19\00\00\1b.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b?\19\87\01\19\00\00\1c.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\87\01\19\00\00\1d.\01\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\87\01\19\00\00\1e.\00\11\01\12\06@\18n\0e\03\0e:\0b;\05?\19\87\01\19\00\00\1f.\00\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00 .\00n\0e\03\0e:\0b;\0b6\0b \0b\00\00!.\00n\0e\03\0e:\0b;\0b\87\01\19 \0b\00\00\22.\00\11\01\12\06@\18n\0e\03\0e:\0b;\056\0b\87\01\19\00\00#\1d\011\13\11\01\12\06X\0bY\0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01\12\06\00\00\029\01\03\0e\00\00\03.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\00\00\04\1d\011\10\11\01\12\06X\0bY\05W\0b\00\00\05\1d\011\10\11\01\12\06X\0bY\0bW\0b\00\00\06\1d\001\10\11\01\12\06X\0bY\0bW\0b\00\00\07\1d\001\10U\17X\0bY\0bW\0b\00\00\08\1d\011\10U\17X\0bY\0bW\0b\00\00\09\1d\001\10U\17X\0bY\05W\0b\00\00\0a\1d\001\10\11\01\12\06X\0bY\05W\0b\00\00\0b\11\01%\0e\13\05\03\0e\10\17\1b\0e\00\00\0c.\00n\0e\03\0e:\0b;\0b \0b\00\00\0d.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\0e.\00n\0e\03\0e:\0b;\05 \0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01\12\06\00\00\029\01\03\0e\00\00\03.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\00\00\04\1d\011\10U\17X\0bY\05W\0b\00\00\05\1d\011\10U\17X\0bY\0bW\0b\00\00\06\1d\011\10\11\01\12\06X\0bY\0bW\0b\00\00\07\1d\001\10\11\01\12\06X\0bY\05W\0b\00\00\08\1d\001\10\11\01\12\06X\0bY\0bW\0b\00\00\09\1d\001\10U\17X\0bY\0bW\0b\00\00\0a\11\01%\0e\13\05\03\0e\10\17\1b\0e\00\00\0b.\00n\0e\03\0e:\0b;\05 \0b\00\00\0c.\00n\0e\03\0e:\0b;\0b \0b\00\00\0d.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01\12\06\00\00\029\01\03\0e\00\00\03.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\00\00\04\1d\011\10\11\01\12\06X\0bY\05W\0b\00\00\05\1d\011\10\11\01\12\06X\0bY\0bW\0b\00\00\06\1d\011\10U\17X\0bY\0bW\0b\00\00\07\1d\001\10U\17X\0bY\05W\0b\00\00\08\1d\001\10\11\01\12\06X\0bY\05W\0b\00\00\09\1d\001\10\11\01\12\06X\0bY\0bW\0b\00\00\0a\11\01%\0e\13\05\03\0e\10\17\1b\0e\00\00\0b.\00n\0e\03\0e:\0b;\0b \0b\00\00\0c.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\0d.\00n\0e\03\0e:\0b;\05 \0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01U\17\00\00\029\01\03\0e\00\00\03.\00n\0e\03\0e:\0b;\0b \0b\00\00\04.\00n\0e\03\0e:\0b;\05 \0b\00\00\05.\01\11\01\12\06@\18n\0e\03\0e:\0b;\0b\00\00\06\1d\001\13\11\01\12\06X\0bY\0bW\0b\00\00\07\1d\011\13\11\01\12\06X\0bY\0bW\0b\00\00\08\1d\011\13\11\01\12\06X\0bY\0b\00\00\09\1d\011\13\11\01\12\06X\0bY\05W\0b\00\00\0a\1d\001\13\11\01\12\06X\0bY\05W\0b\00\00\0b\1d\011\13U\17X\0bY\05W\0b\00\00\0c\1d\001\13U\17X\0bY\05W\0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01\12\06\00\00\029\01\03\0e\00\00\03.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\00\00\04\1d\001\10\11\01\12\06X\0bY\05W\0b\00\00\05\11\01%\0e\13\05\03\0e\10\17\1b\0e\00\00\06.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\00\01\11\01%\0e\13\05\03\0e\10\17\1b\0e\11\01\12\06\00\00\029\01\03\0e\00\00\03.\01\11\01\12\06@\18\03\0e:\0b;\05?\19\00\00\04\1d\001\10\11\01\12\06X\0bY\05W\0b\00\00\05\11\01%\0e\13\05\03\0e\10\17\1b\0e\00\00\06.\00n\0e\03\0e:\0b;\05?\19 \0b\00\00\00")
  (@producers
    (language "Rust" "")
    (processed-by "clang" "16.0.4 (https://github.com/llvm/llvm-project ae42196bc493ffe877a7e3dff8be32035dea4d07)")
    (processed-by "rustc" "1.78.0 (9b00956e5 2024-04-29)")
  )
  (@custom "target_features" (after data) "\03+\0bbulk-memory+\0fmutable-globals+\08sign-ext")
)