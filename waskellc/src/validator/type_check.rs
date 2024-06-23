// SPDX-License-Identifier: MIT

use std::slice;

use crate::validator::symbol_check::*;

pub fn type_check_sym(symbol: &Symbol) -> Result<(), String> {
    if let Some(expr) = &symbol.expr {
        let mut ty = type_check_expr(expr, &mut vec![], &symbol.ty)
            .map_err(|e| format!("Error type checking symbol {}: {}", symbol.name, e))?;

        if !matches!(ty, Type::Function(_)) {
            ty = Type::Function(vec![ty]);
        }

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

        if symbol.is_exported && !ty_slice.iter().all(|ty| matches!(ty, Type::Function(_))) {
            return Err(format!(
                "Symbol {} has type {:?} which can't be exported",
                symbol.name, symbol.ty
            ));
        }
    }
    Ok(())
}

fn type_check_expr(
    expr: &Expression,
    scope: &mut Vec<(String, Type)>,
    parent_ty: &Type,
) -> Result<Type, String> {
    match expr {
        Expression::IntLiteral(_) => Ok(Type::Int),
        Expression::StringLiteral(_) => Ok(Type::String),
        Expression::CharLiteral(_) => Ok(Type::Char),
        Expression::Symbol(symbol) => {
            let symbol = (*symbol).borrow();
            Ok(symbol.ty.clone())
        }
        Expression::FunctionParameter(name) => {
            let ty = scope
                .iter()
                .find(|(param_name, _)| param_name == name)
                .map(|(_, ty)| ty.clone())
                .ok_or(format!("Parameter {} not found in scope", name))?;
            Ok(ty)
        }
        Expression::FunctionApplication(exprs) => {
            if exprs.is_empty() {
                return Err("Function application must have at least one parameter".to_string());
            }

            let mut exprs_iter = exprs.iter();
            let func = exprs_iter
                .next()
                .ok_or("Function application must have at least one parameter")?;
            let func_ty = type_check_expr(func, scope, parent_ty)?;
            if let Type::Function(_) = func_ty {
            } else {
                // TODO: function as value
                return Err(format!("Can't apply a value of type {:?}", func_ty));
            }

            let mut param_tys = vec![];
            for expr in exprs_iter {
                let ty = type_check_expr(expr, scope, parent_ty)?;
                param_tys.push(ty);
            }

            if let Type::Function(tys) = func_ty {
                // TODO: partial application
                if tys.len() - 1 != param_tys.len() {
                    return Err("Function application has wrong number of parameters".to_string());
                }

                for (i, (expected_ty, actual_ty)) in tys.iter().zip(param_tys.iter()).enumerate() {
                    if expected_ty != actual_ty {
                        return Err(format!("Parameter {} has wrong type", i));
                    }
                }

                Ok(tys.last().unwrap().clone())
            } else {
                unreachable!()
            }
        }
        Expression::LambdaAbstraction(params, expr) => {
            // TODO: this only works for a top-level lambda (aka function declaration) since the
            // scope is passed by the symbol.
            if let Type::Function(tys) = parent_ty {
                if tys.len() - 1 != params.len() {
                    return Err(format!(
                        "Lambda has {} parameters but parent type has {}",
                        params.len(),
                        tys.len()
                    ));
                }

                let lambda_scope = params
                    .iter()
                    .zip(tys.iter())
                    .map(|(name, ty)| (name.clone(), ty.clone()))
                    .collect::<Vec<_>>();

                scope.extend(lambda_scope);
            } else {
                return Err(format!(
                    "Parent type of lambda is not a function but a {:?}",
                    parent_ty
                ));
            }

            let expr_ty = type_check_expr(expr, scope, parent_ty)?;

            let mut tys = scope
                .iter()
                .map(|(_, ty)| ty.clone())
                .collect::<Vec<Type>>();
            tys.push(expr_ty.clone());
            Ok(Type::Function(tys))
        }
    }
}
