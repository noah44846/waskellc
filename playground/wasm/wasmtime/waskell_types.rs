use wasi_common::{sync::WasiCtxBuilder, WasiCtx};
use wasmtime::*;

pub fn waskell_types_main() -> Result<()> {
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
        //.func_wrap("foreign", "print", |arg: i32| -> () {
        //println!("Printing from host: {}", arg);
        //})?
        .module(&mut store, "", &module)?;
    let instance = linker.instantiate(&mut store, &module)?;

    let memory = instance
        .get_memory(&mut store, "memory")
        .ok_or(anyhow::anyhow!("failed to find memory export"))?;
    let main = instance.get_typed_func::<(), u32>(&mut store, "main")?;
    //let square = instance.get_typed_func::<i32, i32>(&mut store, "square")?;
    //let sq_print = instance.get_typed_func::<i32, ()>(&mut store, "sq_print")?;

    let ptr = main.call(&mut store, ())?;
    println!(
        "main returned: {:?}",
        parse_waskell_list(ptr, &store, &memory)?
    );

    //println!("square(2): {}", square.call(&mut store, 5)?);

    //sq_print.call(&mut store, 2)?;

    Ok(())
}

enum WaskellIntTree {
    Nil,
    Node(Box<WaskellIntTree>, i32, Box<WaskellIntTree>),
}

fn create_waskell_tree(
    tree: WaskellIntTree,
    instance: &Instance,
    store: &mut Store<WasiCtx>,
) -> Result<u32> {
    let nil = instance.get_typed_func::<(), u32>(&mut *store, "nil")?;
    let node = instance.get_typed_func::<(u32, i32, u32), u32>(&mut *store, "node")?;

    match tree {
        WaskellIntTree::Nil => nil.call(&mut *store, ()),
        WaskellIntTree::Node(left, value, right) => {
            let left_ptr = create_waskell_tree(*left, instance, store)?;
            let right_ptr = create_waskell_tree(*right, instance, store)?;

            node.call(&mut *store, (left_ptr, value, right_ptr))
        }
    }
}

fn parse_waskell_list(ptr: u32, store: &Store<WasiCtx>, memory: &Memory) -> Result<Vec<i32>> {
    let mut result = Vec::new();
    let mut ptr = ptr as usize;
    let mut buffer = [0u8; 16];
    loop {
        memory.read(store, ptr, &mut buffer)?;
        let constr_idx = i32::from_le_bytes([buffer[4], buffer[5], buffer[6], buffer[7]]);
        if constr_idx != 1 {
            break;
        }
        let value = i32::from_le_bytes([buffer[8], buffer[9], buffer[10], buffer[11]]);
        ptr = u32::from_le_bytes([buffer[12], buffer[13], buffer[14], buffer[15]]) as usize;
        result.push(value);
    }
    Ok(result)
}
