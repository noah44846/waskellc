use wasi_common::sync::WasiCtxBuilder;
use wasmtime::*;

pub fn usage_example_main() -> Result<()> {
    let engine = Engine::default();
    let mut linker = Linker::new(&engine);
    wasi_common::sync::add_to_linker(&mut linker, |s| s)?;

    let wasi = WasiCtxBuilder::new()
        .inherit_stdio()
        .inherit_args()?
        .build();
    let mut store = Store::new(&engine, wasi);

    let module = Module::from_file(&engine, "../../../waskellc/out.wasm")?;
    linker
        .func_wrap("foreign", "print", |arg: i32| -> () {
            println!("Printing from host: {}", arg);
        })?
        .module(&mut store, "", &module)?;
    let instance = linker.instantiate(&mut store, &module)?;

    let _memory = instance
        .get_memory(&mut store, "memory")
        .ok_or(anyhow::anyhow!("failed to find memory export"))?;
    let main = instance.get_typed_func::<(), ()>(&mut store, "main")?;

    main.call(&mut store, ())?;
    // square (square 2)
    //let val_ptr = make_val.call(&mut store, 2)?;

    //let env_ptr1 = make_env.call(&mut store, (1, 11))?;
    //let val_ptr_parts = val_ptr.to_le_bytes();
    //memory.write(&mut store, (env_ptr1 + 4) as usize, &val_ptr_parts)?;

    //let closure_ptr1 = make_closure.call(&mut store, (1, env_ptr1))?;

    //let env_ptr2 = make_env.call(&mut store, (1, 11))?;
    //let closure_ptr1_parts = closure_ptr1.to_le_bytes();
    //memory.write(&mut store, (env_ptr2 + 4) as usize, &closure_ptr1_parts)?;

    //let closure_ptr2 = make_closure.call(&mut store, (1, env_ptr2))?;

    //let res = eval.call(&mut store, closure_ptr2)?;
    //println!("res: {:?}", res);

    Ok(())
}
