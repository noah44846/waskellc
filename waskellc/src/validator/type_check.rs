// SPDX-License-Identifier: MIT

use crate::validator::symbol_check::*;

pub fn type_check_expr(expr: &Expression, context: &Symbol) -> Result<Type, String> {
    match expr {
        Expression::IntLiteral(_) => Ok(Type::Int),
        Expression::FloatLiteral(_) => Ok(Type::Float),
        Expression::StringLiteral(_) => Ok(Type::String),
        Expression::CharLiteral(_) => Ok(Type::Char),
        Expression::Symbol(symbol) => {
            let symbol = (*symbol).borrow();
            Ok(symbol.ty.clone())
        }
        Expression::FunctionApplication(exprs) => {
            if exprs.is_empty() {
                return Err("Function application must have at least one parameter".to_string());
            }

            let mut exprs_iter = exprs.iter();
            let func = exprs_iter
                .next()
                .ok_or("Function application must have at least one parameter")?;
            let func_ty = type_check_expr(func, context)?;
            if let Type::Function(_) = func_ty {
            } else {
                return Err(format!("Can't apply a value of type {:?}", func_ty));
            }

            let mut param_tys = vec![];
            for expr in exprs_iter {
                let ty = type_check_expr(expr, context)?;
                param_tys.push(ty);
            }

            match func_ty {
                Type::Function(tys) => {
                    if tys.len() - 1 != param_tys.len() {
                        println!("{:#?} {:#?}", tys, param_tys);
                        return Err(
                            "Function application has wrong number of parameters".to_string()
                        );
                    }

                    for (i, (expected_ty, actual_ty)) in
                        tys.iter().zip(param_tys.iter()).enumerate()
                    {
                        if expected_ty != actual_ty {
                            return Err(format!("Parameter {} has wrong type", i));
                        }
                    }

                    Ok(tys.last().unwrap().clone())
                }
                _ => unreachable!(),
            }
        }
        Expression::LambdaAbstraction(params, expr) => {
            let expr_ty = type_check_expr(expr, context)?;

            if context.arity() < params.len() as u8 {
                return Err("Lambda expression has wrong arity".to_string());
            }

            #[allow(clippy::single_match)]
            match expr_ty {
                Type::Function(ref params) => match &context.ty {
                    Type::Function(ctx_params) => {
                        // drop the first n params (n = arity)
                        let ctx_params = ctx_params.iter().skip(params.len()).collect::<Vec<_>>();

                        // check if the number of params match
                        if ctx_params.len() != params.len() {
                            return Err(
                                "Lambda expression has wrong number of parameters".to_string()
                            );
                        }

                        for (expected_ty, actual_ty) in ctx_params.iter().zip(params.iter()) {
                            if **expected_ty != *actual_ty {
                                return Err(
                                    "Lambda expression has wrong parameter types".to_string()
                                );
                            }
                        }
                    }
                    _ => (),
                },
                Type::List(_) => {
                    todo!()
                }
                Type::Tuple(_) => {
                    todo!()
                }
                _ => {
                    if context.return_type().unwrap() != &expr_ty {
                        return Err("Lambda expression has wrong return type".to_string());
                    }
                }
            }

            Ok(Type::Function(vec![expr_ty, Type::Int]))
        }
    }
}
