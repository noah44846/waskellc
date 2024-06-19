// SPDX-License-Identifier: MIT

//! Code gen module is responsible for generating the Wasm code from the AST of the Waskell
//! programming language.

use std::{
    cell::RefCell,
    collections::{hash_map, HashMap},
    rc::Rc,
};

use wasm_encoder::*;

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

        if let hash_map::Entry::Vacant(e) = self.map.entry(tys.clone()) {
            self.type_section
                .function(Vec::from(&tys[..tys.len() - 1]), vec![*tys.last().unwrap()]);
            let val = EntityType::Function(self.type_section.len() - 1);
            e.insert(val);
            return Some(val);
        }

        return self.map.get(&tys).cloned();
    }
}

struct DeclaredWasmFunctionIndices {
    function_index: u32,
    table_index: u32,
}

impl DeclaredWasmFunctionIndices {
    fn new(element_section: &mut ElementSection, function_index: u32) -> Self {
        DeclaredWasmFunctionIndices {
            function_index,
            // + 2 because of the fn_app and value functions in the lib
            table_index: element_section.len() + 2 - 1,
        }
    }
}

struct CodeGen {
    import_section: ImportSection,
    function_section: FunctionSection,
    export_section: ExportSection,
    element_section: ElementSection,
    code_section: CodeSection,
    function_types: DeclaredWasmFunctionTypes,
    function_indices: HashMap<String, DeclaredWasmFunctionIndices>,
    symbol_table: Rc<validator::SymbolTable>,
}

fn add_fn_to_table(element_section: &mut ElementSection, function_index: u32) {
    element_section.active(
        None,
        // + 2 because of the fn_app and value functions in the lib
        &ConstExpr::i32_const((element_section.len() + 2) as i32),
        Elements::Functions(&[function_index]),
    );
}

impl CodeGen {
    pub fn new(symbol_table: validator::SymbolTable) -> Self {
        let mut function_indices = HashMap::new();
        let type_section = TypeSection::new();
        let mut function_types = DeclaredWasmFunctionTypes::new(type_section);
        let mut import_section = ImportSection::new();
        let mut element_section = ElementSection::new();

        let _ = function_types.function_type(vec![ValType::I32]).unwrap();
        let arg_1_int32_ret_int32 = function_types
            .function_type(vec![ValType::I32, ValType::I32])
            .unwrap();
        let arg_2_int32_ret_int32 = function_types
            .function_type(vec![ValType::I32, ValType::I32, ValType::I32])
            .unwrap();

        // TODO: implement fn_app
        import_section.import(
            "lib",
            "table",
            EntityType::Table(TableType {
                element_type: RefType::FUNCREF,
                minimum: 128, // TODO: what is the minimum size of the table?
                maximum: None,
                table64: false,
            }),
        );

        // TODO: memory size ??
        import_section.import(
            "lib",
            "memory",
            EntityType::Memory(MemoryType {
                minimum: 1,
                maximum: None,
                memory64: false,
                shared: false,
                page_size_log2: None,
            }),
        );

        let mut handle_import = |name: &str, ty: EntityType| {
            import_section.import("lib", name, ty);

            // -2 because of the memory and table imports
            let function_index = import_section.len() - 2 - 1;
            add_fn_to_table(&mut element_section, function_index);

            let declared_function_indecies =
                DeclaredWasmFunctionIndices::new(&mut element_section, function_index);
            function_indices.insert(name.to_owned(), declared_function_indecies);
        };

        [
            ("eval", arg_1_int32_ret_int32),
            ("make_closure", arg_2_int32_ret_int32),
            ("make_env", arg_2_int32_ret_int32),
            ("make_val", arg_1_int32_ret_int32),
            ("negate", arg_1_int32_ret_int32),
            ("+", arg_2_int32_ret_int32),
            ("-", arg_2_int32_ret_int32),
            ("*", arg_2_int32_ret_int32),
            ("/", arg_2_int32_ret_int32),
        ]
        .iter()
        .for_each(|(name, ty)| handle_import(name, *ty));

        CodeGen {
            import_section,
            function_section: FunctionSection::new(),
            export_section: ExportSection::new(),
            element_section,
            code_section: CodeSection::new(),
            function_types,
            function_indices,
            symbol_table: Rc::new(symbol_table),
        }
    }

    pub fn generate(mut self) -> Result<Vec<u8>, String> {
        for symbol in self.symbol_table.clone().values() {
            // skip non global symbols
            if (**symbol).borrow().scope.is_some() {
                continue;
            }

            // skip if the function is already generated
            if self
                .function_indices
                .contains_key(&(**symbol).borrow().name)
            {
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
            .section(&self.element_section)
            .section(&self.code_section);

        let wasm_bytes = module.finish();
        wasmparser::validate(&wasm_bytes).map_err(|e| e.to_string())?;
        Ok(wasm_bytes)
    }

    fn generate_function(&mut self, symbol: &Rc<RefCell<validator::Symbol>>) -> Result<(), String> {
        // TODO: skip if the function is already generated and the type is already in the type section
        let func_type = self.create_signature(symbol)?;
        self.generate_function_body(symbol, func_type)?;

        Ok(())
    }

    fn create_signature(
        &mut self,
        symbol: &Rc<RefCell<validator::Symbol>>,
    ) -> Result<EntityType, String> {
        let mut params = vec![];

        match &(**symbol).borrow().ty {
            validator::Type::Function(func_params) => {
                // put the last element of the params as the result and the rest as the params
                if func_params.is_empty() {
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

        Ok(self.function_types.function_type(params).unwrap())
    }

    fn generate_function_body(
        &mut self,
        symbol: &Rc<RefCell<validator::Symbol>>,
        func_ty: EntityType,
    ) -> Result<(), String> {
        let mut locals = vec![];
        let mut instrs = vec![];

        let symbol_ref = (**symbol).borrow();
        let expr = symbol_ref.expr.as_ref().ok_or(format!(
            "Function {} does not have an expression",
            symbol_ref.name
        ))?;
        self.generate_instructions_from_top_level_expr(expr, &mut locals, &mut instrs)?;

        let mut rle_locals: Vec<(u32, ValType)> = vec![];
        if !locals.is_empty() {
            // do run length encoding (Vec<ValType> -> Vec<(u32, ValType)>)
            let mut count = 1;
            let mut prev = locals[0];
            for ty in locals.iter().skip(1) {
                if prev == *ty {
                    count += 1;
                } else {
                    rle_locals.push((count, prev));
                    count = 1;
                    prev = *ty;
                }
            }
            rle_locals.push((count, prev));
        }

        let mut f = Function::new(rle_locals);
        instrs.iter().for_each(|instr| {
            f.instruction(instr);
        });

        if let EntityType::Function(type_index) = func_ty {
            self.function_section.function(type_index);
            self.code_section.function(&f);

            // the import section has -2 because of the memory import
            let function_index = (self.import_section.len() - 2) + self.function_section.len() - 1;
            add_fn_to_table(&mut self.element_section, function_index);

            self.export_section
                .export(&(**symbol).borrow().name, ExportKind::Func, function_index);

            let declared_function_indecies =
                DeclaredWasmFunctionIndices::new(&mut self.element_section, function_index);
            self.function_indices
                .insert((**symbol).borrow().name.clone(), declared_function_indecies);
            Ok(())
        } else {
            unreachable!();
        }
    }

    fn generate_instructions_from_top_level_expr(
        &self,
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        match expr {
            validator::Expression::LambdaAbstraction(syms, body) => {
                self.generate_instructions_for_lambda_body(syms, body, locals, instrs)?;
                instrs.push(Instruction::End);
            }
            _ => todo!(),
        }

        Ok(())
    }

    fn generate_instructions_for_lambda_body(
        &self,
        syms: &[String],
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        match expr {
            validator::Expression::FunctionApplication(params) => {
                let func = &params[0];
                let num_params = params.len() - 1;

                let func_tbl_idx = match func {
                    validator::Expression::Symbol(sym) => {
                        let name = &(**sym).borrow().name;
                        // TODO: check if the function is already generated instead of unwrap
                        let func_tbl_idx = self.function_indices.get(name).unwrap().table_index;
                        func_tbl_idx
                    }
                    _ => todo!(),
                };

                locals.push(ValType::I32);
                let local_idx = locals.len() - 1 + (syms.len());

                let make_env_idx = self
                    .function_indices
                    .get("make_env")
                    .unwrap()
                    .function_index;
                instrs.push(Instruction::I32Const(num_params as i32));
                instrs.push(Instruction::I32Const(func_tbl_idx as i32));
                instrs.push(Instruction::Call(make_env_idx));
                instrs.push(Instruction::LocalSet(local_idx as u32));

                for (i, param) in params.iter().skip(1).enumerate() {
                    match param {
                        validator::Expression::Symbol(sym) => {
                            // find the index of the symbol in the syms
                            let arg_idx = syms
                                .iter()
                                .position(|s| s == &(**sym).borrow().name)
                                .ok_or(format!(
                                    "Symbol {} not found in the lambda abstraction",
                                    (**sym).borrow().name
                                ))?;

                            instrs.push(Instruction::LocalGet(local_idx as u32));
                            instrs.push(Instruction::LocalGet(arg_idx as u32));
                            instrs.push(Instruction::I32Store(MemArg {
                                align: 2,
                                offset: ((i + 1) * 4) as u64,
                                memory_index: 0,
                            }));
                        }
                        validator::Expression::IntLiteral(val) => {
                            let make_val_idx = self
                                .function_indices
                                .get("make_val")
                                .unwrap()
                                .function_index;
                            instrs.push(Instruction::LocalGet(local_idx as u32));
                            instrs.push(Instruction::I32Const(*val as i32));
                            instrs.push(Instruction::Call(make_val_idx));
                            instrs.push(Instruction::I32Store(MemArg {
                                align: 0,
                                offset: ((i + 1) * 4) as u64,
                                memory_index: 0,
                            }));
                        }
                        _ => todo!(),
                    }
                }

                let make_closure_idx = self
                    .function_indices
                    .get("make_closure")
                    .unwrap()
                    .function_index;
                instrs.push(Instruction::I32Const(num_params as i32));
                instrs.push(Instruction::LocalGet(local_idx as u32));
                instrs.push(Instruction::Call(make_closure_idx));
            }
            _ => todo!(),
        }

        Ok(())
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
