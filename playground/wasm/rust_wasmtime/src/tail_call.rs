use std::time::Instant;

use wasmtime::*;

pub fn tail_call_main() -> Result<()> {
    let mut config = Config::new();
    config.wasm_tail_call(true);
    let engine = Engine::new(&config)?;
    let module = Module::from_file(&engine, "wasm_code/tail_call.wat")?;
    let linker = Linker::new(&engine);

    let mut store = Store::new(&engine, ());
    let instance = linker.instantiate(&mut store, &module)?;

    // Like before, we can get the run function and execute it.
    let factorial = instance.get_typed_func::<u64, u64>(&mut store, "factorial")?;
    let factorial_tail = instance.get_typed_func::<u64, u64>(&mut store, "factorial_tail")?;

    let now = Instant::now();
    let res1 = factorial.call(&mut store, 20)?;
    let elapsed1 = now.elapsed();
    println!("factorial(20): {} in {:?}", res1, elapsed1);

    let now = Instant::now();
    let res2 = factorial_tail.call(&mut store, 20)?;
    let elapsed2 = now.elapsed();
    println!("factorial_tail(20): {} in {:?}", res2, elapsed2);

    Ok(())
}
