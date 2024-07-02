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
    linker.module(&mut store, "", &module)?;
    let instance = linker.instantiate(&mut store, &module)?;

    let memory = instance
        .get_memory(&mut store, "memory")
        .ok_or(anyhow::anyhow!("failed to find memory export"))?;
    let flatten_dfs = instance.get_typed_func::<u32, u32>(&mut store, "flattenDfs")?;
    let example_tree_flattened =
        instance.get_typed_func::<(), u32>(&mut store, "exampleTreeFlattened")?;

    let example_tree_flattened_ptr = example_tree_flattened.call(&mut store, ())?;
    println!(
        "exampleTreeFlattened returned: {:?}",
        parse_waskell_list(example_tree_flattened_ptr, &store, &memory)?
    );

    let tree_ptr = create_waskell_tree(
        WaskellIntTree::Node(
            Box::new(WaskellIntTree::Node(
                Box::new(WaskellIntTree::Nil),
                1,
                Box::new(WaskellIntTree::Nil),
            )),
            2,
            Box::new(WaskellIntTree::Node(
                Box::new(WaskellIntTree::Nil),
                3,
                Box::new(WaskellIntTree::Nil),
            )),
        ),
        &instance,
        &mut store,
    )?;

    let list_ptr = flatten_dfs.call(&mut store, tree_ptr)?;

    println!(
        "flattenDfs returned: {:?}",
        parse_waskell_list(list_ptr, &store, &memory)?
    );

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
    let empty = instance.get_typed_func::<(), u32>(&mut *store, "empty")?;
    let node = instance.get_typed_func::<(u32, i32, u32), u32>(&mut *store, "node")?;

    match tree {
        WaskellIntTree::Nil => empty.call(&mut *store, ()),
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
