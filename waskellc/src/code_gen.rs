// SPDX-License-Identifier: MIT

//! Code gen module is responsible for generating the Wasm code from the AST of the Waskell
//! programming language.

use std::{cell::RefCell, collections::HashMap, rc::Rc};

use wasm_encoder::{
    CodeSection, EntityType, ExportSection, FunctionSection, ImportSection, Module, TypeSection,
    ValType,
};

use crate::validator;

struct DeclaredWasmFunctionTypes {
    map: HashMap<Vec<ValType>, EntityType>,
    type_section: TypeSection,
}

impl DeclaredWasmFunctionTypes {
    fn new(type_section: TypeSection) -> Self {
        DeclaredWasmFunctionTypes {
            map: HashMap::new(),
            type_section,
        }
    }

    fn function_type(&mut self, tys: Vec<ValType>) -> Option<EntityType> {
        if tys.is_empty() {
            return None;
        }

        if !self.map.contains_key(&tys) {
            self.type_section.function(
                Vec::from(&tys[..tys.len() - 1]),
                vec![tys.last().unwrap().clone()],
            );
            let val = EntityType::Function(self.type_section.len() - 1);
            self.map.insert(tys, val);
            return Some(val);
        }

        return self.map.get(&tys).cloned();
    }
}

struct CodeGen<'a> {
    import_section: ImportSection,
    function_section: FunctionSection,
    export_section: ExportSection,
    code_section: CodeSection,
    function_types: DeclaredWasmFunctionTypes,
    function_indices: HashMap<&'a str, u32>,
    symbol_table: Rc<validator::SymbolTable>,
}

impl<'a> CodeGen<'a> {
    pub fn new(symbol_table: validator::SymbolTable) -> Self {
        let mut function_indices = HashMap::new();
        let mut type_section = TypeSection::new();
        let mut function_types = DeclaredWasmFunctionTypes::new(type_section);
        let mut import_section = ImportSection::new();

        let _ = function_types.function_type(vec![ValType::I32]).unwrap();
        let arg_1_int32_ret_int32 = function_types
            .function_type(vec![ValType::I32, ValType::I32])
            .unwrap();
        let arg_2_int32_ret_int32 = function_types
            .function_type(vec![ValType::I32, ValType::I32, ValType::I32])
            .unwrap();

        import_section.import("lib", "eval", arg_1_int32_ret_int32);
        function_indices.insert("eval", import_section.len() - 1);
        import_section.import("lib", "make_closure", arg_2_int32_ret_int32);
        function_indices.insert("make_closure", import_section.len() - 1);
        import_section.import("lib", "make_env", arg_2_int32_ret_int32);
        function_indices.insert("make_env", import_section.len() - 1);
        import_section.import("lib", "make_val", arg_1_int32_ret_int32);
        function_indices.insert("make_val", import_section.len() - 1);
        import_section.import("lib", "*", arg_2_int32_ret_int32);
        function_indices.insert("*", import_section.len() - 1);

        CodeGen {
            import_section,
            function_section: FunctionSection::new(),
            export_section: ExportSection::new(),
            code_section: CodeSection::new(),
            function_types,
            function_indices,
            symbol_table: Rc::new(symbol_table),
        }
    }

    pub fn generate(mut self) -> Result<Vec<u8>, String> {
        // example code

        //// Encode the type section.
        //let mut types = TypeSection::new();
        //let params = vec![ValType::I32, ValType::I32];
        //let results = vec![ValType::I32];
        //types.function(params, results);
        //module.section(&types);

        //// Encode the function section.
        //let mut functions = FunctionSection::new();
        //let type_index = 0;
        //functions.function(type_index);
        //module.section(&functions);

        //// Encode the export section.
        //let mut exports = ExportSection::new();
        //exports.export("f", ExportKind::Func, 0);
        //module.section(&exports);

        //// Encode the code section.
        //let mut codes = CodeSection::new();
        //let locals = vec![];
        //let mut f = Function::new(locals);
        //f.instruction(&Instruction::LocalGet(0));
        //f.instruction(&Instruction::LocalGet(1));
        //f.instruction(&Instruction::I32Add);
        //f.instruction(&Instruction::End);
        //codes.function(&f);
        //module.section(&codes);

        for symbol in self.symbol_table.clone().values() {
            if (**symbol).borrow().scope != None {
                continue;
            }
            self.generate_function(&symbol.clone())?;
        }

        let mut module = Module::new();
        module
            .section(&self.function_types.type_section)
            .section(&self.import_section)
            .section(&self.function_section)
            .section(&self.export_section)
            .section(&self.code_section);

        let wasm_bytes = module.finish();
        wasmparser::validate(&wasm_bytes).map_err(|e| e.to_string())?;
        Ok(wasm_bytes)
    }

    fn generate_function(&mut self, symbol: &Rc<RefCell<validator::Symbol>>) -> Result<(), String> {
        // TODO: skip if the function is already generated and the type is already in the type section
        let _func_type_index = self.create_signature(symbol)?;

        Ok(())
    }

    fn create_signature(&mut self, symbol: &Rc<RefCell<validator::Symbol>>) -> Result<u32, String> {
        let mut params = vec![];

        match &(**symbol).borrow().ty {
            validator::Type::Function(func_params) => {
                // put the last element of the params as the result and the rest as the params
                if func_params.len() < 1 {
                    return Err("Function must have at least one parameter".to_string());
                }

                params = func_params
                    .iter()
                    .map(|ty| self.validator_type_to_val_type(ty))
                    .collect::<Option<Vec<ValType>>>()
                    .ok_or("Invalid type")?;
            }
            validator::Type::Int => {
                params.push(ValType::I32);
            }
            _ => todo!(),
        }

        if let EntityType::Function(index) = self.function_types.function_type(params).unwrap() {
            return Ok(index);
        } else {
            unreachable!();
        }
    }

    fn validator_type_to_val_type(&self, ty: &validator::Type) -> Option<ValType> {
        match ty {
            validator::Type::Int => Some(ValType::I32),
            validator::Type::Function(_) => None,
            _ => todo!(),
        }
    }
}

pub fn generate(symbol_table: validator::SymbolTable) -> Result<Vec<u8>, String> {
    let code_gen = CodeGen::new(symbol_table);

    code_gen.generate()
}
