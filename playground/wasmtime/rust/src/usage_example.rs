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
        .func_wrap("foreign", "printInt", |arg: i32| -> () {
            println!("Printing from host: {}", arg);
        })?
        .module(&mut store, "", &module)?;
    let instance = linker.instantiate(&mut store, &module)?;

    let _memory = instance
        .get_memory(&mut store, "memory")
        .ok_or(anyhow::anyhow!("failed to find memory export"))?;
    let main = instance.get_typed_func::<(), ()>(&mut store, "main")?;
    let square = instance.get_typed_func::<i32, i32>(&mut store, "square")?;
    let sq_print = instance.get_typed_func::<i32, ()>(&mut store, "sq_print")?;

    main.call(&mut store, ())?;

    println!("square(5): {}", square.call(&mut store, 5)?);

    sq_print.call(&mut store, 2)?;

    Ok(())
}
