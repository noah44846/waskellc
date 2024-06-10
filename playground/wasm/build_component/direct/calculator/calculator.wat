(module
    (import "docs:adder/add@0.1.0" "add" (func $add (param i32 i32) (result i32)))
    (import "docs:adder/add@0.1.0" "mul" (func $mul (param i32 i32) (result i32)))
    (func (export "docs:calculator/calculate@0.1.0#eval-expression") (param $op i32) (param $a i32) (param $b i32) (result i32)
        local.get $op
        i32.const 0
        i32.eq
        if
            local.get $a
            local.get $b
            call $add
            return
        end

        local.get $op
        i32.const 1
        i32.eq
        if
            local.get $a
            local.get $b
            call $mul
            return
        end
        
        unreachable
    )
)
