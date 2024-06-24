// SPDX-License-Identifier: MIT

use std::slice;

use crate::validator::symbol_check::*;

pub fn type_check_syms(symbol_table: &mut SymbolTable) -> Result<(), String> {
    for symbol in symbol_table.values().cloned().collect::<Vec<_>>() {
        type_check_sym(&mut symbol.as_ref().borrow_mut(), symbol_table)?;
    }
    Ok(())
}

fn type_check_sym(symbol: &mut Symbol, symbol_table: &mut SymbolTable) -> Result<(), String> {
    if let Some(expr) = &mut symbol.expr {
        let ty = type_check_top_level_expr(expr, &symbol.ty, symbol_table)
            .map_err(|e| format!("Error type checking symbol {}: {}", symbol.name, e))?;

        if symbol.ty != ty {
            return Err(format!(
                "Symbol {} has type {:?} but expression has type {:?}",
                symbol.name, symbol.ty, ty
            ));
        }

        let ty_slice: &[_] = if let Type::Function(ref tys) = ty {
            tys
        } else {
            slice::from_ref(&ty)
        };

        if (symbol.is_imported() || symbol.is_exported())
            && !ty_slice.iter().all(|ty| !matches!(ty, Type::Function(_)))
        {
            return Err(format!(
                "Symbol {} has type {:?} which can't be exported",
                symbol.name, symbol.ty
            ));
        }
    }
    Ok(())
}

fn type_check_top_level_expr(
    expr: &mut Expression,
    parent_ty: &Type,
    _symbol_table: &mut SymbolTable,
) -> Result<Type, String> {
    let mut scope = vec![];
    let res: Result<Type, String> = match expr {
        Expression::FunctionApplication(exprs) => {
            if let Type::Function(tys) = parent_ty {
                assert!(tys.len() > 1, "Parent type has to be flattened");

                let mut lambda_params = vec![];
                for i in 0..tys.len() - 1 {
                    lambda_params.push(format!("lambda_{}", i));
                    exprs.push(Expression::FunctionParameter(lambda_params[i].clone()));
                }

                *expr = Expression::LambdaAbstraction(lambda_params, Box::new(expr.clone()));
                type_check_top_level_expr(expr, parent_ty, _symbol_table)
            } else {
                type_check_expr(expr, &mut scope, _symbol_table)
            }
        }
        Expression::LambdaAbstraction(params, expr) => {
            let func_tys = if let Type::Function(tys) = parent_ty {
                tys
            } else {
                return Err(format!(
                    "Parent type of lambda is not a function but a {:?}",
                    parent_ty
                ));
            };

            if func_tys.len() <= params.len() {
                return Err(format!(
                    "Lambda has {} parameters but parent type is {:?}",
                    params.len(),
                    func_tys
                ));
            }

            for (i, ty) in func_tys.iter().enumerate().take(func_tys.len() - 1) {
                if i < params.len() {
                    scope.push((params[i].clone(), ty.clone()));
                } else {
                    params.push(format!("lambda_{}", i));
                    scope.push((params[i].clone(), ty.clone()));

                    match expr.as_mut() {
                        Expression::FunctionApplication(ref mut exprs) => {
                            exprs.push(Expression::FunctionParameter(params[i].clone()));
                        }
                        Expression::Symbol(_)
                        | Expression::FunctionParameter(_)
                        | Expression::LambdaAbstraction(_, _) => {
                            **expr = Expression::FunctionApplication(vec![
                                *expr.clone(),
                                Expression::FunctionParameter(params[i].clone()),
                            ]);
                        }
                        Expression::IntLiteral(_)
                        | Expression::StringLiteral(_)
                        | Expression::CharLiteral(_) => {
                            Err(format!(
                                "Lambda expression must be a function application but got {:?}",
                                expr
                            ))?;
                        }
                    }
                }
            }

            let expr_ty = type_check_expr(expr, &mut scope, _symbol_table)?;

            let mut tys = func_tys.clone();
            tys[func_tys.len() - 1] = expr_ty.clone();
            Ok(Type::Function(tys))
        }
        _ => type_check_expr(expr, &mut scope, _symbol_table),
    };

    flatten_function_ty(&res?)
}

fn type_check_expr(
    expr: &mut Expression,
    scope: &mut Vec<(String, Type)>,
    _symbol_table: &mut SymbolTable,
) -> Result<Type, String> {
    let res: Result<Type, String> = match expr {
        Expression::IntLiteral(_) => Ok(Type::Int),
        Expression::StringLiteral(_) => Ok(Type::List(Box::new(Type::Char))),
        Expression::CharLiteral(_) => Ok(Type::Char),
        Expression::Symbol(symbol) => Ok(symbol.as_ref().borrow().ty.clone()),
        Expression::FunctionParameter(name) => {
            let ty = scope
                .iter()
                .find(|(param_name, _)| param_name == name)
                .map(|(_, ty)| ty.clone())
                .ok_or(format!("Parameter {} not found in scope", name))?;
            Ok(ty)
        }
        Expression::FunctionApplication(exprs) => {
            if exprs.len() < 2 {
                return Err("Function application must have at least two parameter".to_string());
            }

            fn flatten_func_app(exprs: &mut Vec<Expression>) {
                if let Expression::FunctionApplication(inner_exprs) = exprs.first_mut().unwrap() {
                    let mut new_exprs = vec![];
                    new_exprs.extend(inner_exprs.iter().cloned());
                    new_exprs.extend(exprs[1..].to_vec());
                    *exprs = new_exprs;
                    flatten_func_app(exprs);
                }
            }

            flatten_func_app(exprs);

            let func = exprs.first_mut().unwrap();
            let func_ty = type_check_expr(func, scope, _symbol_table)?;
            let func_tys = if let Type::Function(tys) = func_ty.clone() {
                tys
            } else {
                return Err(format!("Can't apply a value of type {:?}", func_ty));
            };

            let mut param_tys = vec![];
            for expr in exprs.iter_mut().skip(1) {
                let ty = type_check_expr(expr, scope, _symbol_table)?;
                param_tys.push(ty);
            }

            if func_tys.len() <= param_tys.len() {
                return Err(format!(
                    "Function has {} parameters but {} were provided",
                    func_tys.len() - 1,
                    param_tys.len()
                ));
            }

            for (i, (expected_ty, actual_ty)) in func_tys.iter().zip(param_tys.iter()).enumerate() {
                if expected_ty != actual_ty {
                    return Err(format!(
                        "Parameter {} has wrong type expected {:?} but got {:?}",
                        i, expected_ty, actual_ty
                    ));
                }
            }

            let pap_return = func_tys[param_tys.len()..].to_vec();

            Ok(if pap_return.len() == 1 {
                // not partial application
                pap_return[0].clone()
            } else {
                // partial application
                Type::Function(pap_return)
            })
        }
        Expression::LambdaAbstraction(_, _) => todo!(),
    };

    flatten_function_ty(&res?)
}

// TODO: easy to test
pub fn flatten_function_ty(ty: &Type) -> Result<Type, String> {
    match ty {
        Type::Function(tys) => {
            if tys.is_empty() {
                return Err("Function type must have at least one parameter".to_string());
            }

            if tys.len() == 1 {
                return flatten_function_ty(&tys[0]);
            }

            let mut res = vec![];
            for ty in tys.iter().take(tys.len() - 1) {
                res.push(flatten_function_ty(ty)?);
            }

            let last_ty = tys.last().unwrap();
            if let Type::Function(tys) = flatten_function_ty(last_ty)? {
                tys.iter()
                    .map(flatten_function_ty)
                    .for_each(|ty| res.push(ty.unwrap()));
            } else {
                res.push(last_ty.clone());
            }

            Ok(Type::Function(res))
        }
        _ => Ok(ty.clone()),
    }
}
