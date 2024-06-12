use wasmtime::component::*;
use wasmtime::{Config, Engine, Store};

bindgen!("calculator");

use exports::docs::calculator::calculate::Op;

// https://docs.rs/wasmtime/latest/wasmtime/component/macro.bindgen.html
fn main() -> wasmtime::Result<()> {
    let mut config = Config::new();
    config.wasm_component_model(true);
    let engine = Engine::new(&config)?;
    let component = Component::from_file(
        &engine,
        "../../build_component/direct/calculator/out/composed.wasm",
    )?;

    let linker = Linker::new(&engine);

    let mut store = Store::new(&engine, ());
    let (bindings, _) = Calculator::instantiate(&mut store, &component, &linker)?;
    let interface = bindings.docs_calculator_calculate();

    let res = interface.call_eval_expression(&mut store, Op::Add, 1, 2)?;
    println!("Result1: {}", res);
    let res = interface.call_eval_expression(&mut store, Op::Mul, 9, 10)?;
    println!("Result2: {}", res);

    Ok(())
}
