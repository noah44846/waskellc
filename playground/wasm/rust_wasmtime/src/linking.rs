use std::str::MatchIndices;

use wasi_common::sync::WasiCtxBuilder;
use wasmtime::*;

pub fn linking_main() -> Result<()> {
    let engine = Engine::default();

    let mut linker = Linker::new(&engine);
    wasi_common::sync::add_to_linker(&mut linker, |s| s)?;

    let linking1 = Module::from_file(&engine, "wasm_code/linking/lib.wasm")?;
    let linking2 = Module::from_file(&engine, "wasm_code/linking/use.wat")?;

    let wasi = WasiCtxBuilder::new()
        .inherit_stdio()
        .inherit_args()?
        .build();
    let mut store = Store::new(&engine, wasi);

    let linking1 = linker.instantiate(&mut store, &linking1)?;
    linker.instance(&mut store, "1", linking1)?;
    //let memory = linking1.get_memory(&mut store, "memory").ok_or(anyhow::anyhow!("failed to find memory export"))?;
    //let dealloc = linking1.get_typed_func::<(u32, u32), ()>(&mut store, "dealloc")?;
    //let copy = linking1.get_typed_func::<(u32, u32), u32>(&mut store, "copy")?;
    //let create_closure = linking1.get_typed_func::<(u32, u32), u32>(&mut store, "create_closure")?;
    let main = linking1.get_typed_func::<(), ()>(&mut store, "main")?;

    let linking2 = linker.instantiate(&mut store, &linking2)?;
    //let write = linking2.get_typed_func::<(), (u32, u32)>(&mut store, "write")?;
    let n_main = linking2.get_typed_func::<u32, ()>(&mut store, "n_main")?;
    let use_closure = linking2.get_typed_func::<(), ()>(&mut store, "use_closure")?;
    //let use_closure1 = linking2.get_typed_func::<(), ()>(&mut store, "use_closure1")?;
    //let use_closure2 = linking2.get_typed_func::<(), ()>(&mut store, "use_closure2")?;

    let res = use_closure.call(&mut store, ())?;
    println!("res: {:?}", res);

    main.call(&mut store, ())?;

    //let res1 = write.call(&mut store, ())?;
    //let mut buffer1 = [0u8; 4];
    //memory.read(&store, res1.0 as usize, &mut buffer1)?;

    //println!("res1: {:?}", res1);

    //let res2 = copy.call(&mut store, (res1.0, res1.1))?;
    //let mut buffer2 = [0u8; 4];
    //memory.read(&store, res2 as usize, &mut buffer2)?;

    //println!("res2: {:?}", res2);

    //for i in buffer1.iter() {
        //print!("{}", *i as char);
    //}

    //println!();

    //for i in buffer2.iter() {
        //print!("{}", *i as char);
    //}

    //println!();

    //dealloc.call(&mut store, (res1.0, res1.1))?;
    //dealloc.call(&mut store, (res2, res1.1))?;

    Ok(())
}
