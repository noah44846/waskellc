use wasi_common::sync::WasiCtxBuilder;
use wasmtime::*;

pub fn code_gen_main() -> Result<()> {
    let mut config = Config::new();
    config.wasm_reference_types(true);
    config.wasm_function_references(true);
    let engine = Engine::new(&config)?;

    //let linking1 = Module::from_file(&engine, "wasm_code/code_gen/lib.wasm")?;
    //let linking2 = Module::from_file(&engine, "wasm_code/code_gen/use.wat")?;
    let linking2 = Module::from_file(&engine, "wasm_code/code_gen/merged.wasm")?;
    let mut linker = Linker::new(&engine);
    wasi_common::sync::add_to_linker(&mut linker, |s| s)?;

    let wasi = WasiCtxBuilder::new()
        .inherit_stdio()
        .inherit_args()?
        .build();
    let mut store = Store::new(&engine, wasi);

    //let linking1 = linker.instantiate(&mut store, &linking1)?;
    //linker.instance(&mut store, "1", linking1)?;

    let linking2 = linker.instantiate(&mut store, &linking2)?;

    //let memory = linking1
    let memory = linking2
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
