use wasmtime::*;

pub fn ref_types_main() -> Result<()> {
    let mut config = Config::new();
    config.wasm_reference_types(true);
    config.wasm_function_references(true);
    let engine = Engine::new(&config)?;
    let module = Module::from_file(&engine, "wasm_code/ref_types.wat")?;
    let linker = Linker::new(&engine);

    let mut store = Store::new(&engine, ());
    let instance = linker.instantiate(&mut store, &module)?;

    // Like before, we can get the run function and execute it.
    let run = instance.get_typed_func::<u32, u32>(&mut store, "call")?;
    let res = run.call(&mut store, 41)?;
    println!("Result: {}", res);

    Ok(())
}
