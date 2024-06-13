use wasmer::{imports, Instance, Module, Store, Value};

fn main() -> anyhow::Result<()> {
    let module_wat = r#"
    (module
        (table 1 funcref)
        (type $t0 (func (result i32)))
        (type $t1 (func (param i32) (result i32)))

        (func $create_closure (export "create_closure") (result i32)
            i32.const 0
            ref.func $foo
            table.set 0
            i32.const 0
        )

        (func $foo (export "foo") (result i32)
            i32.const 42
        )

        (func $use_closure (export "use_closure") (result i32)
            call $create_closure
            call_indirect 0 (type $t0)
        )
    )
    "#;

    let mut store = Store::default();
    let module = Module::new(&store, &module_wat)?;
    // The module doesn't import anything, so we create an empty import object.
    let import_object = imports! {};
    let instance = Instance::new(&mut store, &module, &import_object)?;

    let use_closure = instance.exports.get_function("use_closure")?;
    let result = use_closure.call(&mut store, &[])?;
    assert_eq!(result[0], Value::I32(42));

    Ok(())
}
