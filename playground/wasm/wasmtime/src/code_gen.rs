use wasi_common::sync::WasiCtxBuilder;
use wasmtime::*;

pub fn code_gen_main() -> Result<()> {
    let mut config = Config::new();
    config.wasm_reference_types(true);
    config.wasm_function_references(true);
    let engine = Engine::new(&config)?;

    let wat = r#"
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
        (i32.eq (i32.const 2) (local.get $n))
        if
          (i32.load offset=4 (local.get $ptr))
          (i32.load offset=8 (local.get $ptr))
          (i32.load (local.get $ptr))
          call_indirect (type $ap2)
          return
        end

        (i32.eq (i32.const 1) (local.get $n))
        if
          (i32.load offset=4 (local.get $ptr))
          (i32.load (local.get $ptr))
          call_indirect (type $ap1)
          return
        end

        (i32.eq (i32.const 0) (local.get $n))
        if
          (i32.load (local.get $ptr))
          call_indirect (type $ap0)
          return
        end

        unreachable
      )

      (func $value (param $x i32) (result i32)
        local.get $x
      )

      (func $make_closure (export "make_closure") (param $n i32) (param $env i32) (result i32)
        (local $a i32)
        (local.set $a (call $alloc (i32.const 9)))
        (i32.store8 (local.get $a) (i32.const 0))
        (i32.store offset=1 (local.get $a) (local.get $n))
        (i32.store offset=5 (local.get $a) (local.get $env))
        local.get $a
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
        local.get $a
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
          (i32.ne (i32.const 0) (i32.load8_u (local.get $ptr)))
          if
            (return (call $value
              (i32.load offset=1 (local.get $ptr))))
          else
            (local.set $ptr
              (call $fn_app
                (i32.load offset=1 (local.get $ptr))
                (i32.load offset=5 (local.get $ptr))))

            (;return (i32.load offset=1 (local.get $ptr));)
            br $loop
          end
        )
        unreachable
      )
    )
    "#;

    let linking1 = Module::from_file(&engine, "wasm_code/linking/lib.wasm")?;
    let linking2 = Module::new(&engine, wat)?;
    let mut linker = Linker::new(&engine);
    wasi_common::sync::add_to_linker(&mut linker, |s| s)?;

    let wasi = WasiCtxBuilder::new()
        .inherit_stdio()
        .inherit_args()?
        .build();
    let mut store = Store::new(&engine, wasi);

    let linking1 = linker.instantiate(&mut store, &linking1)?;
    linker.instance(&mut store, "1", linking1)?;

    let linking2 = linker.instantiate(&mut store, &linking2)?;

    let memory = linking1
        .get_memory(&mut store, "memory")
        .ok_or(anyhow::anyhow!("failed to find memory export"))?;
    let make_closure = linking2.get_typed_func::<(u32, u32), u32>(&mut store, "make_closure")?;
    let make_env = linking2.get_typed_func::<(u32, u32), u32>(&mut store, "make_env")?;
    let make_val = linking2.get_typed_func::<u32, u32>(&mut store, "make_val")?;
    let eval = linking2.get_typed_func::<u32, u32>(&mut store, "eval")?;

    // square (square 2)
    let val_ptr = make_val.call(&mut store, 2)?;

    let env_ptr1 = make_env.call(&mut store, (1, 3))?;
    let val_ptr_parts = val_ptr.to_le_bytes();
    memory.write(&mut store, (env_ptr1 + 4) as usize, &val_ptr_parts)?;

    let closure_ptr1 = make_closure.call(&mut store, (1, env_ptr1))?;

    let env_ptr2 = make_env.call(&mut store, (1, 3))?;
    let closure_ptr1_parts = closure_ptr1.to_le_bytes();
    memory.write(&mut store, (env_ptr2 + 4) as usize, &closure_ptr1_parts)?;

    let closure_ptr2 = make_closure.call(&mut store, (1, env_ptr2))?;

    let res = eval.call(&mut store, closure_ptr2)?;
    println!("res: {:?}", res);

    Ok(())
}
