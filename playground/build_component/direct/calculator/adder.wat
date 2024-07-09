(module
    (func (export "docs:adder/add@0.1.0#add") (param $a i32) (param $b i32) (result i32)
        local.get $a
        local.get $b
        i32.add)

    (func (export "docs:adder/add@0.1.0#mul") (param $a i32) (param $b i32) (result i32)
        local.get $a
        local.get $b
        i32.mul)
)
