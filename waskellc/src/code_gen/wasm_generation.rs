// SPDX-License-Identifier: MIT

use std::{cell::RefCell, rc::Rc};

use wasm_encoder::*;

use crate::code_gen::encoder_wrapper::{
    DeclaredWasmFunctionTypes, DeclaredWasmFunctions, DeclaredWasmImports,
};

use crate::validator;

struct CodeGen {
    code_section: CodeSection,
    function_types: DeclaredWasmFunctionTypes,
    imports: Option<DeclaredWasmImports>,
    functions: Option<DeclaredWasmFunctions>,
    symbol_table: Rc<validator::SymbolTable>,
}

impl CodeGen {
    fn generate(symbol_table: validator::SymbolTable) -> Result<Vec<u8>, String> {
        let symbol_table = Rc::new(symbol_table);

        let mut res = CodeGen {
            code_section: CodeSection::new(),
            function_types: DeclaredWasmFunctionTypes::new(),
            imports: Some(DeclaredWasmImports::new()),
            functions: None,
            symbol_table,
        };

        res.handle_imports()?;

        res.generate_functions()
    }

    fn handle_imports(&mut self) -> Result<(), String> {
        let imports = self.imports.as_mut().unwrap();

        let arg_1_int32_ret_int32 = self
            .function_types
            .function_type(vec![ValType::I32], Some(ValType::I32))
            .unwrap();
        let arg_2_int32_ret_int32 = self
            .function_types
            .function_type(vec![ValType::I32, ValType::I32], Some(ValType::I32))
            .unwrap();

        // TODO: memory size ??
        imports.import_memory(
            "lib",
            "memory",
            MemoryType {
                minimum: 1,
                maximum: None,
                memory64: false,
                shared: false,
                page_size_log2: None,
            },
        );

        imports
            .import_func("lib", "eval", arg_1_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_closure", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_env", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_val", arg_1_int32_ret_int32)
            .unwrap();

        self.symbol_table
            .clone()
            .values()
            .filter(|s| {
                let s = (***s).borrow();
                s.scope.is_none() && s.import_module_name.is_some()
            })
            .map(|s| {
                let symbol_ref = (**s).borrow();
                let ty_idx = self.func_ty_idx_from_symbol(&symbol_ref, true)?;
                let module_name = symbol_ref.import_module_name.unwrap();
                self.imports
                    .as_mut()
                    .unwrap()
                    .import_func(module_name, &symbol_ref.name, ty_idx)
            })
            .collect::<Result<Vec<_>, String>>()?;

        let imports = self.imports.take().unwrap();
        self.functions = Some(imports.to_functions(arg_2_int32_ret_int32));

        self.generate_apply_function()?;

        self.symbol_table
            .clone()
            .values()
            .filter(|s| {
                let s = (***s).borrow();
                s.scope.is_none() && s.import_module_name == Some("foreign")
            })
            .map(|s| self.generate_foreign_import_wrapper(&(**s).borrow()))
            .collect::<Result<Vec<_>, String>>()?;

        Ok(())
    }

    fn generate_functions(mut self) -> Result<Vec<u8>, String> {
        self.symbol_table
            .clone()
            .values()
            .filter(|s| {
                let s = (***s).borrow();
                s.scope.is_none() && s.import_module_name.is_none()
            })
            .map(|s| match self.create_signature(s) {
                Ok(_) => Ok(s),
                Err(e) => Err(e),
            })
            // collect to ensure that all the signatures are created before generating the function body
            .collect::<Result<Vec<_>, String>>()?
            .iter()
            .map(|s| self.generate_function_body(s))
            .collect::<Result<Vec<_>, String>>()?;

        let type_section = self.function_types.type_section();
        let (import_section, function_section, export_section, element_section) =
            self.functions.unwrap().finish();

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

    fn func_ty_idx_from_symbol(
        &mut self,
        symbol: &validator::Symbol,
        check_for_export: bool,
    ) -> Result<u32, String> {
        let (params, return_ty) = match &symbol.ty {
            validator::Type::Function(func_params) => {
                // put the last element of the params as the result and the rest as the params
                if func_params.is_empty() {
                    return Err("Function must have at least one parameter".to_string());
                }

                let params = vec![ValType::I32; func_params.len() - 1];

                let return_ty = if let validator::Type::Unit = func_params.last().unwrap() {
                    if check_for_export
                        && (symbol.is_exported || symbol.import_module_name.is_some())
                    {
                        None
                    } else {
                        Some(ValType::I32)
                    }
                } else {
                    Some(ValType::I32)
                };
                (params, return_ty)
            }
            _ => (vec![], Some(ValType::I32)),
        };

        Ok(self
            .function_types
            .function_type(params, return_ty)
            .unwrap())
    }

    fn create_signature(&mut self, symbol: &Rc<RefCell<validator::Symbol>>) -> Result<(), String> {
        let symbol_ref = (**symbol).borrow();

        let func_type = self.func_ty_idx_from_symbol(&symbol_ref, false)?;

        self.functions
            .as_mut()
            .unwrap()
            .add_function(&symbol_ref.name, func_type)
            .ok_or(format!(
                "Function {} already exists in the function table",
                symbol_ref.name
            ))?;

        // TODO: more elegant way to handle the order in which the functions are added (function section and code section have to be in the same order)
        if symbol_ref.is_exported {
            let func_type = self.func_ty_idx_from_symbol(&symbol_ref, true)?;
            let exported_func_name = format!("exported_{}", symbol_ref.name);
            self.functions
                .as_mut()
                .unwrap()
                .add_function(&exported_func_name, func_type);
            self.functions
                .as_mut()
                .unwrap()
                .export(&exported_func_name, &symbol_ref.name);
        }

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

        self.generate_instructions_from_top_level_expr(expr, &mut locals, &mut instrs)?;

        fn add_function_to_code_section(
            code_section: &mut CodeSection,
            locals: &[ValType],
            instrs: &[Instruction],
        ) {
            let mut rle_locals: Vec<(u32, ValType)> = vec![];
            if !locals.is_empty() {
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

            code_section.function(&f);
        }

        add_function_to_code_section(&mut self.code_section, &locals, &instrs);

        if symbol_ref.is_exported {
            let mut instrs = vec![];
            self.generate_instructions_from_exported(&symbol_ref, &mut instrs)?;
            add_function_to_code_section(&mut self.code_section, &[], &instrs);
        }

        Ok(())
    }

    fn generate_instructions_from_exported(
        &mut self,
        sym: &validator::Symbol,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        let exported_func_name = format!("exported_{}", &sym.name);
        self.functions
            .as_mut()
            .unwrap()
            .function_index(&exported_func_name)
            .ok_or(format!(
                "Exported function definition {} not found",
                exported_func_name
            ))?;

        let functions = self.functions.as_mut().unwrap();
        let func_idx = functions
            .function_index(&sym.name)
            .ok_or(format!("Function {} not found", sym.name))?;
        let eval_idx = functions
            .function_index("eval")
            .ok_or("Function eval not found in the function table")?;
        let make_val_idx = functions
            .function_index("make_val")
            .ok_or("Function make_val not found in the function table")?;

        match &sym.ty {
            validator::Type::Function(params) => {
                let num_params = params.len() - 1;

                for i in 0..num_params {
                    instrs.push(Instruction::LocalGet(i as u32));
                    instrs.push(Instruction::Call(make_val_idx));
                }
                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::Call(eval_idx));

                if let validator::Type::Unit = params.last().unwrap() {
                    instrs.push(Instruction::Drop);
                }

                instrs.push(Instruction::End);
            }
            validator::Type::List(_) | validator::Type::Tuple(_) => todo!(),
            ty => {
                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::Call(eval_idx));

                if let validator::Type::Unit = ty {
                    instrs.push(Instruction::Drop);
                }

                instrs.push(Instruction::End);
            }
        };
        Ok(())
    }

    fn generate_foreign_import_wrapper(&mut self, sym: &validator::Symbol) -> Result<(), String> {
        let mut instrs = vec![];
        let func_name = format!("imported_{}", &sym.name);

        let wrapper_ty_idx = self.func_ty_idx_from_symbol(sym, true)?;

        let functions = self.functions.as_mut().unwrap();
        // declare the wrapper function
        functions
            .add_function(&func_name, wrapper_ty_idx)
            .ok_or(format!("Function {} already exists", func_name))?;

        let func_idx = functions
            .function_index(&sym.name)
            .ok_or(format!("Function {} not found", sym.name))?;
        let make_val_idx = functions
            .function_index("make_val")
            .ok_or("Function make_val not found in the function table")?;
        let eval_idx = functions
            .function_index("eval")
            .ok_or("Function eval not found in the function table")?;

        for i in 0..sym.arity() {
            instrs.push(Instruction::LocalGet(i as u32));
            instrs.push(Instruction::Call(eval_idx));
        }

        instrs.push(Instruction::Call(func_idx));

        if let validator::Type::Function(params) = &sym.ty {
            if let validator::Type::Unit = params.last().unwrap() {
            } else {
                instrs.push(Instruction::Call(make_val_idx));
            }
        } else {
            return Err(
                "Foreign import must be a function (should have been catched by sym_checker)"
                    .to_string(),
            );
        }

        instrs.push(Instruction::End);

        let mut f = Function::new(vec![]);
        instrs.iter().for_each(|instr| {
            f.instruction(instr);
        });

        self.code_section.function(&f);

        Ok(())
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
            validator::Expression::FunctionApplication(_) => {
                let local_idx = self.generate_instructions_for_expr(&[], expr, locals, instrs)?;
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
        locals.push(ValType::I32);
        let local_idx = locals.len() - 1 + (syms.len());

        match expr {
            validator::Expression::FunctionApplication(params) => {
                let func = &params[0];
                let num_params = params.len() - 1;

                let mut imported = false;
                let func_tbl_idx = match func {
                    validator::Expression::Symbol(sym) => {
                        let sym_ref = (**sym).borrow();

                        let name = if let Some("foreign") = sym_ref.import_module_name {
                            // TODO: fix this
                            imported = true;
                            format!("imported_{}", &sym_ref.name)
                        } else {
                            sym_ref.name.clone()
                        };
                        // TODO: check if the function is already generated instead of unwrap
                        self.functions
                            .as_mut()
                            .unwrap()
                            .table_index(&name)
                            .ok_or(format!("Function {} not found in the function table", name))?
                    }
                    _ => todo!(),
                };

                let make_env_idx = self
                    .functions
                    .as_mut()
                    .unwrap()
                    .function_index("make_env")
                    .ok_or("Function make_env not found in the function table")?;

                // TODO: fix this
                if imported {
                    instrs.push(Instruction::I32Const(-1));
                } else {
                    instrs.push(Instruction::I32Const(num_params as i32));
                }
                instrs.push(Instruction::I32Const(func_tbl_idx as i32));
                instrs.push(Instruction::Call(make_env_idx));
                instrs.push(Instruction::LocalSet(local_idx as u32));

                for (i, param) in params.iter().skip(1).enumerate() {
                    let rec_local_idx =
                        self.generate_instructions_for_expr(syms, param, locals, instrs)?;
                    instrs.push(Instruction::LocalGet(local_idx as u32));
                    instrs.push(Instruction::LocalGet(rec_local_idx));
                    instrs.push(Instruction::I32Store(MemArg {
                        align: 2,
                        offset: ((i + 1) * 4) as u64,
                        memory_index: 0,
                    }));
                }

                let make_closure_idx = self
                    .functions
                    .as_mut()
                    .unwrap()
                    .function_index("make_closure")
                    .ok_or("Function make_closure not found in the function table")?;

                if imported {
                    instrs.push(Instruction::I32Const(-1));
                } else {
                    instrs.push(Instruction::I32Const(num_params as i32));
                }
                instrs.push(Instruction::LocalGet(local_idx as u32));
                instrs.push(Instruction::Call(make_closure_idx));
                instrs.push(Instruction::LocalSet(local_idx as u32));

                Ok(local_idx as u32)
            }
            validator::Expression::Symbol(sym) => {
                let sym_name = &(**sym).borrow().name;
                let sym_idx = syms.iter().position(|s| s == sym_name).ok_or(format!(
                    "Symbol {} not accessible in the lambda abstraction",
                    sym_name
                ))?;
                Ok(sym_idx as u32)
            }
            validator::Expression::IntLiteral(val) => {
                let make_val_idx = self
                    .functions
                    .as_mut()
                    .unwrap()
                    .function_index("make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(*val as i32));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::LocalSet(local_idx as u32));
                Ok(local_idx as u32)
            }
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
                let s = (**s).borrow();
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

        let functions = self.functions.as_mut().unwrap();

        functions
            .function_index("apply")
            .expect("Function apply not found");
        let apply_table_idx = functions
            .table_index("apply")
            .expect("Function apply not found");
        assert!(
            apply_table_idx == 0,
            "apply function must be the first function in the table"
        );

        //TODO: remove
        let print_idx = functions
            .function_index("print")
            .expect("Function print not found");

        let mut instrs = vec![];
        for i in 0..=max_application {
            // TODO: add handling for unit type
            let ty_idx = self
                .function_types
                .function_type(vec![ValType::I32; i as usize], Some(ValType::I32))
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

        // TODO: fix this
        let ty_idx = self
            .function_types
            .function_type(vec![ValType::I32], None)
            .unwrap();
        let make_val_idx = functions
            .function_index("make_val")
            .expect("Function make_val not found");

        instrs.push(Instruction::LocalGet(0));
        instrs.push(Instruction::I32Const(-1));
        instrs.push(Instruction::I32Eq);
        instrs.push(Instruction::If(BlockType::Empty));
        instrs.push(Instruction::LocalGet(1));
        instrs.push(Instruction::I32Load(MemArg {
            align: 2,
            offset: 4,
            memory_index: 0,
        }));
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
        instrs.push(Instruction::I32Const(0));
        instrs.push(Instruction::Call(make_val_idx));
        instrs.push(Instruction::Return);
        instrs.push(Instruction::End);

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
    CodeGen::generate(symbol_table)
}
