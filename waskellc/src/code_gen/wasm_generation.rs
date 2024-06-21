// SPDX-License-Identifier: MIT

use std::{cell::RefCell, rc::Rc};

use wasm_encoder::*;

use crate::code_gen::encoder_wrapper::{DeclaredWasmFunctionTypes, DeclaredWasmFunctions};
use crate::validator;

struct CodeGen {
    code_section: CodeSection,
    function_types: DeclaredWasmFunctionTypes,
    functions: DeclaredWasmFunctions,
    symbol_table: Rc<validator::SymbolTable>,
}

impl CodeGen {
    fn new(symbol_table: validator::SymbolTable) -> Self {
        let mut function_types = DeclaredWasmFunctionTypes::new();
        let mut import_section = ImportSection::new();

        function_types.function_type(vec![ValType::I32]).unwrap();
        let arg_1_int32_ret_int32 = function_types
            .function_type(vec![ValType::I32, ValType::I32])
            .unwrap();
        let arg_2_int32_ret_int32 = function_types
            .function_type(vec![ValType::I32, ValType::I32, ValType::I32])
            .unwrap();

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

        let functions = DeclaredWasmFunctions::new(
            import_section,
            &[
                ("lib", "eval", arg_1_int32_ret_int32),
                ("lib", "make_closure", arg_2_int32_ret_int32),
                ("lib", "make_env", arg_2_int32_ret_int32),
                ("lib", "make_val", arg_1_int32_ret_int32),
                ("lib", "negate", arg_1_int32_ret_int32),
                ("lib", "+", arg_2_int32_ret_int32),
                ("lib", "-", arg_2_int32_ret_int32),
                ("lib", "*", arg_2_int32_ret_int32),
                ("lib", "/", arg_2_int32_ret_int32),
            ],
            arg_2_int32_ret_int32,
        );

        let mut res = CodeGen {
            code_section: CodeSection::new(),
            function_types,
            functions,
            symbol_table: Rc::new(symbol_table),
        };

        res.generate_apply_function().unwrap();

        res
    }

    fn generate(mut self) -> Result<Vec<u8>, String> {
        self.symbol_table
            .clone()
            .values()
            .filter(|s| {
                let s = (**s).borrow();
                s.scope.is_none() && !self.functions.exists(&s.name)
            })
            .collect::<Vec<_>>()
            // create signature for each symbol so they can be called while generating the function body
            .iter()
            .map(|s| match self.create_signature(s) {
                Ok(_) => Ok(s),
                Err(e) => Err(e),
            })
            .collect::<Result<Vec<_>, String>>()?
            .iter()
            .map(|s| self.generate_function_body(s))
            .collect::<Result<Vec<_>, String>>()?;

        let type_section = self.function_types.type_section();
        let (import_section, function_section, export_section, element_section) =
            self.functions.finish();

        let mut module = Module::new();
        module
            .section(&type_section)
            .section(&import_section)
            .section(&function_section)
            .section(&export_section)
            .section(&element_section)
            .section(&self.code_section);

        let wasm_bytes = module.finish();
        wasmparser::validate(&wasm_bytes).map_err(|e| e.to_string())?;
        Ok(wasm_bytes)
    }

    fn create_signature(&mut self, symbol: &Rc<RefCell<validator::Symbol>>) -> Result<(), String> {
        let mut params = vec![];
        let symbol_ref = &(**symbol).borrow();

        match &symbol_ref.ty {
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

        let func_type = self.function_types.function_type(params).unwrap();
        self.functions
            .add_function(&symbol_ref.name, func_type)
            .ok_or(format!(
                "Function {} already exists in the function table",
                symbol_ref.name
            ))?;
        self.functions.export(&symbol_ref.name).unwrap();

        Ok(())
    }

    fn generate_function_body(
        &mut self,
        symbol: &Rc<RefCell<validator::Symbol>>,
    ) -> Result<(), String> {
        let mut locals = vec![];
        let mut instrs = vec![];

        let symbol_ref = (**symbol).borrow();
        let expr = symbol_ref.expr.as_ref().ok_or(format!(
            "Function {} does not have an expression",
            symbol_ref.name
        ))?;

        if symbol_ref.name == "main" {
            self.generate_instructions_from_main(expr, &mut locals, &mut instrs)?;
        } else {
            self.generate_instructions_from_top_level_expr(expr, &mut locals, &mut instrs)?;
        }

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

        self.code_section.function(&f);
        Ok(())
    }

    fn generate_instructions_from_main(
        &mut self,
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        match expr {
            validator::Expression::FunctionApplication(_) => {
                let eval_idx = self
                    .functions
                    .function_index("eval")
                    .ok_or("Function eval not found in the function table")?;
                let local_idx = self.generate_instructions_for_expr(&[], expr, locals, instrs)?;
                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::Call(eval_idx));
                instrs.push(Instruction::End);
                Ok(())
            }
            validator::Expression::LambdaAbstraction(_, _) => {
                Err("Main function can't be a lambda abstraction".to_string())
            }
            _ => todo!(),
        }
    }

    fn generate_instructions_from_top_level_expr(
        &mut self,
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        match expr {
            validator::Expression::LambdaAbstraction(syms, body) => {
                let local_idx = self.generate_instructions_for_expr(syms, body, locals, instrs)?;
                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::End);
            }
            _ => todo!(),
        }

        Ok(())
    }

    fn generate_instructions_for_expr(
        &mut self,
        syms: &[String],
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
    ) -> Result<u32, String> {
        match expr {
            validator::Expression::FunctionApplication(params) => {
                let func = &params[0];
                let num_params = params.len() - 1;

                let func_tbl_idx = match func {
                    validator::Expression::Symbol(sym) => {
                        let name = &(**sym).borrow().name;
                        // TODO: check if the function is already generated instead of unwrap
                        self.functions
                            .table_index(name)
                            .ok_or(format!("Function {} not found in the function table", name))?
                    }
                    _ => todo!(),
                };

                locals.push(ValType::I32);
                let local_idx = locals.len() - 1 + (syms.len());

                let make_env_idx = self
                    .functions
                    .function_index("make_env")
                    .ok_or("Function make_env not found in the function table")?;
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
                                .functions
                                .function_index("make_val")
                                .ok_or("Function make_val not found in the function table")?;
                            instrs.push(Instruction::LocalGet(local_idx as u32));
                            instrs.push(Instruction::I32Const(*val as i32));
                            instrs.push(Instruction::Call(make_val_idx));
                            instrs.push(Instruction::I32Store(MemArg {
                                align: 2,
                                offset: ((i + 1) * 4) as u64,
                                memory_index: 0,
                            }));
                        }
                        validator::Expression::FunctionApplication(_) => {
                            let fn_local_idx =
                                self.generate_instructions_for_expr(syms, param, locals, instrs)?;
                            instrs.push(Instruction::LocalGet(local_idx as u32));
                            instrs.push(Instruction::LocalGet(fn_local_idx));
                            instrs.push(Instruction::I32Store(MemArg {
                                align: 2,
                                offset: ((i + 1) * 4) as u64,
                                memory_index: 0,
                            }));
                        }
                        _ => todo!(),
                    }
                }

                let make_closure_idx = self
                    .functions
                    .function_index("make_closure")
                    .ok_or("Function make_closure not found in the function table")?;
                instrs.push(Instruction::I32Const(num_params as i32));
                instrs.push(Instruction::LocalGet(local_idx as u32));
                instrs.push(Instruction::Call(make_closure_idx));
                instrs.push(Instruction::LocalSet(local_idx as u32));

                Ok(local_idx as u32)
            }
            _ => todo!(),
        }
    }

    fn validator_type_to_val_type(&self, ty: &validator::Type) -> Option<ValType> {
        match ty {
            validator::Type::Int => Some(ValType::I32),
            validator::Type::Function(_) => None,
            _ => todo!(),
        }
    }

    fn generate_apply_function(&mut self) -> Result<(), String> {
        // TODO: remove fn_app and value form element in wat file since they never get called indirectly

        fn max_application_in_expr(expr: &validator::Expression) -> u32 {
            match expr {
                validator::Expression::FunctionApplication(params) => {
                    let mut current_max = (params.len() - 1) as u32;
                    for param in params {
                        current_max = current_max.max(max_application_in_expr(param));
                    }
                    current_max
                }
                _ => 0,
            }
        }

        let max_application = self
            .symbol_table
            .clone()
            .iter()
            .map(|(_, s)| {
                let s = s.borrow();
                match &s.ty {
                    validator::Type::Function(params) => {
                        let mut current_max = (params.len() - 1) as u32;
                        if let Some(expr) = &s.expr {
                            current_max = current_max.max(max_application_in_expr(expr));
                        }
                        current_max
                    }
                    _ => 0,
                }
            })
            .max()
            .unwrap();

        self.functions
            .function_index("apply")
            .expect("Function apply not found");
        let apply_table_idx = self
            .functions
            .table_index("apply")
            .expect("Function apply not found");
        assert!(
            apply_table_idx == 0,
            "apply function must be the first function in the table"
        );

        let mut instrs = vec![];
        for i in 0..=max_application {
            let ty_idx = self
                .function_types
                .function_type(vec![ValType::I32; (i + 1) as usize])
                .unwrap();

            instrs.push(Instruction::LocalGet(0));
            instrs.push(Instruction::I32Const(i as i32));
            instrs.push(Instruction::I32Eq);
            instrs.push(Instruction::If(BlockType::Empty));
            for j in 0..i {
                instrs.push(Instruction::LocalGet(1));
                instrs.push(Instruction::I32Load(MemArg {
                    align: 2,
                    offset: (4 * (j + 1)) as u64,
                    memory_index: 0,
                }));
            }
            instrs.push(Instruction::LocalGet(1));
            instrs.push(Instruction::I32Load(MemArg {
                align: 2,
                offset: 0,
                memory_index: 0,
            }));
            instrs.push(Instruction::CallIndirect {
                ty: ty_idx,
                table: 0,
            });
            instrs.push(Instruction::Return);
            instrs.push(Instruction::End);
        }

        instrs.push(Instruction::Unreachable);
        instrs.push(Instruction::End);

        let mut f = Function::new(vec![]);
        instrs.iter().for_each(|instr| {
            f.instruction(instr);
        });

        self.code_section.function(&f);
        Ok(())
    }
}

pub fn generate_code(symbol_table: validator::SymbolTable) -> Result<Vec<u8>, String> {
    let code_gen = CodeGen::new(symbol_table);

    code_gen.generate()
}
