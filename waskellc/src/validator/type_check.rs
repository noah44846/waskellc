// SPDX-License-Identifier: MIT

use std::{cell::RefCell, collections::HashMap, fmt, rc::Rc, slice};

use itertools::Itertools;

use crate::validator::symbol_check::*;

/// A Key type for the TypeVarAssignments HashMap
#[derive(Debug, Clone, Eq, Hash, PartialEq)]
struct TypeVarAssignmentKey {
    /// The name of the type variable
    var_name: String,
    /// The name of the context symbol
    ctx_symbol_name: String,
}

impl TryFrom<&Type> for TypeVarAssignmentKey {
    type Error = String;

    fn try_from(ty: &Type) -> Result<Self, Self::Error> {
        match ty {
            Type::TypeVar {
                var_name,
                ctx_symbol_name,
            } => Ok(Self {
                var_name: var_name.clone(),
                ctx_symbol_name: ctx_symbol_name.clone(),
            }),
            _ => Err(format!("Can't convert {:?} to TypeVarAssignmentKey", ty)),
        }
    }
}

/// A Value type for the TypeVarAssignments HashMap
#[derive(Clone, PartialEq)]
struct TypeVarAssignmentValue {
    /// The type variable wrapped in a node of a disjoint set
    ty: disjoint_sets::UnionFindNode<Type>,
    /// The concrete type of the type variable
    concrete_ty: Option<Type>,
}

impl fmt::Debug for TypeVarAssignmentValue {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("TypeVarAssignmentValue")
            .field("ty", &self.ty)
            .field("concrete_ty", &self.concrete_ty)
            .field("find", &self.ty.find())
            .finish()
    }
}

impl TryFrom<&Type> for TypeVarAssignmentValue {
    type Error = String;

    fn try_from(ty: &Type) -> Result<Self, Self::Error> {
        match ty {
            Type::TypeVar { .. } => Ok(Self {
                ty: disjoint_sets::UnionFindNode::new(ty.clone()),
                concrete_ty: None,
            }),
            _ => Err(format!("Can't convert {:?} to TypeVarAssignmentValue", ty)),
        }
    }
}

/// A HashMap that maps type variables to their values
#[derive(Debug)]
struct TypeVarAssignments(HashMap<TypeVarAssignmentKey, TypeVarAssignmentValue>);

impl TypeVarAssignments {
    /// Creates a new TypeVarAssignments
    fn new() -> Self {
        Self(HashMap::new())
    }

    /// Gets the value of a type variable
    fn get(&self, ty: &Type) -> Option<&TypeVarAssignmentValue> {
        self.0.get(&ty.try_into().unwrap())
    }

    /// Compares two types recursively and assigns the type variables if possible
    fn assign_or_check(&mut self, ty1: &Type, ty2: &Type) -> bool {
        match (ty1, ty2) {
            (Type::TypeVar { .. }, Type::TypeVar { .. }) => {
                let mut inner_ty1 = self
                    .0
                    .remove(&ty1.try_into().unwrap())
                    .unwrap_or(ty1.try_into().unwrap());
                let mut inner_ty2 = self
                    .0
                    .remove(&ty2.try_into().unwrap())
                    .unwrap_or(ty2.try_into().unwrap());

                if inner_ty1.concrete_ty.is_none() && inner_ty2.concrete_ty.is_none() {
                    inner_ty1.ty.union(&mut inner_ty2.ty);

                    self.0.insert(ty1.try_into().unwrap(), inner_ty1);
                    self.0.insert(ty2.try_into().unwrap(), inner_ty2);

                    return true;
                } else if let Some(concrete_ty) = &inner_ty1.concrete_ty {
                    self.0.insert(ty2.try_into().unwrap(), inner_ty2);
                    self.assign_or_check(concrete_ty, ty2); // we know that the result is true
                                                            // since this case can only return
                                                            // false if the ty2 has a concrete
                                                            // type which is not the case
                    inner_ty2 = self
                        .0
                        .remove(&ty2.try_into().unwrap())
                        .unwrap_or(ty2.try_into().unwrap());
                } else if let Some(concrete_ty) = &inner_ty2.concrete_ty {
                    self.0.insert(ty1.try_into().unwrap(), inner_ty1);
                    self.assign_or_check(ty1, concrete_ty); // we know that the result is true
                                                            // since this case can only return
                                                            // false if the ty1 has a concrete
                                                            // type which is not the case
                    inner_ty1 = self
                        .0
                        .remove(&ty1.try_into().unwrap())
                        .unwrap_or(ty1.try_into().unwrap());
                }

                let res = if inner_ty1.concrete_ty == inner_ty2.concrete_ty {
                    inner_ty1.ty.union(&mut inner_ty2.ty);
                    true
                } else {
                    false
                };

                self.0.insert(ty1.try_into().unwrap(), inner_ty1);
                self.0.insert(ty2.try_into().unwrap(), inner_ty2);

                res
            }
            (Type::TypeVar { .. }, _) => {
                let mut inner_ty1 = self
                    .0
                    .remove(&ty1.try_into().unwrap())
                    .unwrap_or(ty1.try_into().unwrap());

                let res = if let Some(concrete_ty) = &inner_ty1.concrete_ty {
                    self.assign_or_check(concrete_ty, ty2)
                } else {
                    let root = inner_ty1.ty.find();
                    for (_, inner_ty) in self.0.iter_mut() {
                        if inner_ty.ty.find() == root {
                            inner_ty.concrete_ty = Some(ty2.clone());
                        }
                    }
                    inner_ty1.concrete_ty = Some(ty2.clone());
                    true
                };

                self.0.insert(ty1.try_into().unwrap(), inner_ty1);

                res
            }
            (_, Type::TypeVar { .. }) => self.assign_or_check(ty2, ty1),
            (Type::Function(tys1), Type::Function(tys2)) => {
                if tys1.len() != tys2.len() {
                    return false;
                }

                tys1.iter()
                    .zip(tys2.iter())
                    .all(|(ty1, ty2)| self.assign_or_check(ty1, ty2))
            }
            (Type::Tuple(tys1), Type::Tuple(tys2)) => {
                if tys1.len() != tys2.len() {
                    return false;
                }

                tys1.iter()
                    .zip(tys2.iter())
                    .all(|(ty1, ty2)| self.assign_or_check(ty1, ty2))
            }
            (Type::CustomType(name1, tys1), Type::CustomType(name2, tys2)) => {
                if name1 != name2 {
                    return false;
                }

                tys1.iter()
                    .zip(tys2.iter())
                    .all(|(ty1, ty2)| self.assign_or_check(ty1, ty2))
            }
            _ => *ty1 == *ty2,
        }
    }
}

/// Type checks the symbol table. The symbol table consumed, modified and returned.
///
/// The symbol table is consumed because if it isn't consumed, a mutable reference to the symbol
/// would be held by the symbol table.
pub fn type_check_syms(symbol_table: SymbolTable) -> Result<SymbolTable, String> {
    let mut res = HashMap::new();
    for (name, symbol) in symbol_table.into_iter() {
        let mut sym = symbol.as_ref().borrow().clone();
        type_check_sym(&mut sym)?;
        res.insert(name, Rc::new(RefCell::new(sym)));
    }
    Ok(res)
}

/// Type checks a symbol and returns an error if the symbol has an invalid type. The symbol is
/// modified in place.
fn type_check_sym(symbol: &mut Symbol) -> Result<(), String> {
    let is_imported = symbol.is_imported();
    let is_exported = symbol.is_exported();

    if let Some(expr) = &mut symbol.expr {
        let ty_slice: &[_] = if let Type::Function(ref tys) = symbol.ty {
            tys
        } else {
            slice::from_ref(&symbol.ty)
        };

        if (is_imported || is_exported)
            && !ty_slice.iter().all(|ty| !matches!(ty, Type::Function(_)))
        {
            return Err(format!(
                "Symbol {} has type {:#?} which can't be exported",
                symbol.name, symbol.ty
            ));
        }

        type_check_top_level_expr(expr, &symbol.ty)
            .map_err(|e| format!("Error type checking symbol {}:\n{}", symbol.name, e))?;
    }
    Ok(())
}

/// Type checks a top level expression and returns an error if the expression has an invalid type.
///
/// If the expression is has type variables, the assignments are checked to verify that a generic
/// function doesn't have a concrete types in the same disjoint set for example.
fn type_check_top_level_expr(expr: &mut Expression, parent_ty: &Type) -> Result<(), String> {
    let mut scope = vec![];
    let mut ty_var_assigns = TypeVarAssignments::new();

    let res = match expr {
        Expression::FunctionApplication { params: exprs, .. } => {
            if let Type::Function(tys) = parent_ty {
                assert!(tys.len() > 1, "Parent type has to be flattened");

                let mut lambda_params = vec![];
                for i in 0..tys.len() - 1 {
                    lambda_params.push(format!("lambda_{}", i));
                    exprs.push(Expression::ScopeSymbol(lambda_params[i].clone()));
                }

                *expr = Expression::LambdaAbstraction(lambda_params, Box::new(expr.clone()));
                return type_check_top_level_expr(expr, parent_ty);
            } else {
                type_check_expr(expr, &mut scope, &mut ty_var_assigns)
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
                        Expression::FunctionApplication { params: exprs, .. } => {
                            exprs.push(Expression::ScopeSymbol(params[i].clone()));
                        }
                        Expression::Symbol(_)
                        | Expression::ScopeSymbol(_)
                        | Expression::LambdaAbstraction(_, _) => {
                            **expr = Expression::FunctionApplication {
                                params: vec![
                                    *expr.clone(),
                                    Expression::ScopeSymbol(params[i].clone()),
                                ],
                                is_partial: false, // temporary value -> will be updated in type_check_expr
                            };
                        }
                        Expression::IntLiteral(_)
                        | Expression::StringLiteral(_)
                        | Expression::CharLiteral(_)
                        | Expression::UnitValue => {
                            Err(format!(
                                "Lambda expression must be a function application but got {:#?}",
                                expr
                            ))?;
                        }
                        _ => todo!("{:?}", expr),
                    }
                }
            }

            let mut ty_var_assigns = TypeVarAssignments::new();
            let expr_ty = type_check_expr(expr, &mut scope, &mut ty_var_assigns)?;

            if !ty_var_assigns.assign_or_check(&func_tys[func_tys.len() - 1], &expr_ty) {
                return Err(format!(
                    "Lambda expression has return type {:#?} but parent has {:#?} with assignments {:#?}",
                    expr_ty,
                    func_tys.last().unwrap(),
                    ty_var_assigns,
                ));
            }

            // collect all type vars from the function type recursively
            fn collect_type_vars(ty: &Type) -> Vec<Type> {
                match ty {
                    Type::TypeVar { .. } => vec![ty.clone()],
                    Type::Function(tys) => {
                        tys.iter().flat_map(collect_type_vars).collect::<Vec<_>>()
                    }
                    _ => vec![],
                }
            }

            // check if no type vars are in the same disjoint set and that they don't have a
            // concrete type
            let is_valid = collect_type_vars(&expr_ty)
                .iter()
                .unique()
                .tuple_combinations()
                .filter(|(ty1, ty2)| {
                    ty_var_assigns.get(ty1).is_some() && ty_var_assigns.get(ty2).is_some()
                })
                .all(|(ty1, ty2)| {
                    let inner_ty1 = ty_var_assigns.get(ty1).unwrap();
                    let inner_ty2 = ty_var_assigns.get(ty2).unwrap();

                    inner_ty1.concrete_ty.is_none()
                        && inner_ty2.concrete_ty.is_none()
                        && inner_ty1.ty.find() != inner_ty2.ty.find()
                });

            if !is_valid {
                return Err(format!(
                    "Lambda expression has type {:#?} with invalid type vars",
                    expr_ty
                ));
            }

            return Ok(());
        }
        _ => type_check_expr(expr, &mut scope, &mut ty_var_assigns),
    }?;

    if ty_var_assigns.assign_or_check(parent_ty, &res.clone()) {
        Ok(())
    } else {
        Err(format!(
            "Expression has type {:#?} but parent type is {:#?}",
            res, parent_ty
        ))
    }
}

/// Type checks an expression and returns the type of the expression if it is valid.
///
/// The function applications are flattened and the type variables are assigned in the type
/// variable assignments.
fn type_check_expr(
    expr: &mut Expression,
    scope: &mut Vec<(String, Type)>,
    type_var_assigns: &mut TypeVarAssignments,
) -> Result<Type, String> {
    let res: Result<Type, String> = match expr {
        Expression::IntLiteral(_) => Ok(Type::Int),
        Expression::CharLiteral(_) => Ok(Type::Char),
        Expression::StringLiteral(_) => Ok(Type::CustomType("List".to_string(), vec![Type::Char])),
        Expression::UnitValue => Ok(Type::Unit),
        Expression::Symbol(symbol) => Ok(symbol.as_ref().borrow().ty.clone()),
        Expression::ScopeSymbol(name) => {
            let ty = scope
                .iter()
                .find(|(param_name, _)| param_name == name)
                .map(|(_, ty)| ty.clone())
                .ok_or(format!("Parameter {} not found in scope", name))?;
            Ok(ty)
        }
        Expression::FunctionApplication {
            params: exprs,
            ref mut is_partial,
        } => {
            if exprs.len() < 2 {
                return Err("Function application must have at least two parameter".to_string());
            }

            fn flatten_func_app(exprs: &mut Vec<Expression>) {
                if let Expression::FunctionApplication {
                    params: inner_exprs,
                    ..
                } = exprs.first_mut().unwrap()
                {
                    let mut new_exprs = vec![];
                    new_exprs.extend(inner_exprs.iter().cloned());
                    new_exprs.extend(exprs[1..].to_vec());
                    *exprs = new_exprs;
                    flatten_func_app(exprs);
                }
            }

            flatten_func_app(exprs);

            let func = exprs.first_mut().unwrap();
            // the type var assignments are not really used here because the expression of the
            // function can't be another function application because of the flattening
            let func_ty = type_check_expr(func, scope, &mut TypeVarAssignments::new())?;
            let func_tys = if let Type::Function(tys) = func_ty.clone() {
                tys
            } else {
                return Err(format!("Can't apply a value of type {:?}", func_ty));
            };

            *is_partial = func_tys.len() > exprs.len();

            let mut param_tys = vec![];
            for expr in exprs.iter_mut().skip(1) {
                let expr_ty = type_check_expr(expr, scope, type_var_assigns)?;
                param_tys.push(expr_ty);
            }

            for (i, (expected_ty, actual_ty)) in func_tys.iter().zip(param_tys.iter()).enumerate() {
                if !type_var_assigns.assign_or_check(expected_ty, actual_ty) {
                    return Err(format!(
                        "Parameter {} has wrong type expected {:#?} but got {:#?} with assignments {:#?}",
                        i, expected_ty, actual_ty, type_var_assigns
                    ));
                }
            }

            let pap_return = func_tys[param_tys.len()..].to_vec();

            let ret_ty = if pap_return.len() == 1 {
                // not partial application
                pap_return[0].clone()
            } else {
                // partial application
                Type::Function(pap_return)
            };

            Ok(ret_ty)
        }
        Expression::Tuple(exprs) => {
            let tys = exprs
                .iter_mut()
                .map(|expr| type_check_expr(expr, scope, type_var_assigns))
                .collect::<Result<Vec<_>, _>>()?;
            Ok(Type::Tuple(tys))
        }
        Expression::CaseExpression(CaseExpression {
            input_expr,
            input_ty,
            branches,
        }) => {
            fn extend_scope_for_pattern(
                pattern: &CaseBranchPattern,
                scope: &mut Vec<(String, Type)>,
                input_ty: &Type,
                type_var_assigns: &mut TypeVarAssignments,
            ) -> Result<(), String> {
                match pattern {
                    CaseBranchPattern::AsPattern(var_name, as_pattern) => {
                        scope.push((var_name.clone(), input_ty.clone()));
                        if let Some(as_pattern) = as_pattern {
                            extend_scope_for_pattern(
                                as_pattern,
                                scope,
                                input_ty,
                                type_var_assigns,
                            )?;
                        }
                        Ok(())
                    }
                    CaseBranchPattern::Unit => {
                        if !type_var_assigns.assign_or_check(input_ty, &Type::Unit) {
                            return Err(format!(
                                "Unit pattern has type {:?} but input has type {:?}",
                                pattern, input_ty
                            ));
                        }
                        Ok(())
                    }
                    CaseBranchPattern::Wildcard => Ok(()),
                    CaseBranchPattern::IntLiteral(_) => {
                        if !type_var_assigns.assign_or_check(input_ty, &Type::Int) {
                            return Err(format!(
                                "Int pattern {:?} and input has type {:?} with assignments {:#?}",
                                pattern, input_ty, type_var_assigns
                            ));
                        }
                        Ok(())
                    }
                    CaseBranchPattern::Constructor {
                        data_constructor,
                        fields,
                    } => {
                        let symbol = data_constructor.as_ref().borrow();
                        let ret_ty = symbol.return_type().unwrap().clone();
                        if !type_var_assigns.assign_or_check(input_ty, &ret_ty) {
                            return Err(format!(
                                "Data constructor {} has type {:?} but pattern has type {:?}",
                                symbol.name, symbol.ty, input_ty
                            ));
                        }

                        if fields.len() != symbol.arity() as usize {
                            return Err(format!(
                                "Data constructor {} has {} fields but pattern has {}",
                                symbol.name,
                                symbol.arity(),
                                fields.len()
                            ));
                        }

                        let tys = (0..fields.len()).map(|i| symbol.param_type(i).unwrap());

                        for (field, ty) in fields.iter().zip(tys) {
                            extend_scope_for_pattern(field, scope, ty, type_var_assigns)?;
                        }

                        Ok(())
                    }
                    CaseBranchPattern::Tuple(patterns) => {
                        let ty = if let Type::TypeVar { .. } = input_ty {
                            type_var_assigns
                                .get(input_ty)
                                .map(|inner_ty| {
                                    inner_ty.concrete_ty.as_ref().ok_or(format!(
                                        "Type var {:?} has no concrete type",
                                        input_ty
                                    ))
                                })
                                .ok_or(format!(
                                    "Type var {:?} not found in assignments",
                                    input_ty
                                ))??
                        } else {
                            input_ty
                        };

                        let tys = if let Type::Tuple(tys) = ty {
                            tys.to_vec()
                        } else {
                            return Err(format!(
                                "Tuple pattern has type {:?} but input has type {:?}, with assignments {:#?}",
                                patterns, input_ty, type_var_assigns
                            ));
                        };

                        if patterns.len() != tys.len() {
                            return Err(format!(
                                "Tuple pattern has {} elements but input has {}",
                                patterns.len(),
                                tys.len(),
                            ));
                        }

                        for (pattern, ty) in patterns.iter().zip(tys.iter()) {
                            extend_scope_for_pattern(pattern, scope, ty, type_var_assigns)?;
                        }
                        Ok(())
                    }
                }
            }

            let expr_ty = type_check_expr(input_expr, scope, type_var_assigns)?;

            if !type_var_assigns.assign_or_check(input_ty, &expr_ty) {
                return Err(format!(
                    "Input expression has type {:#?} but expected {:#?}",
                    expr_ty, input_ty
                ));
            }

            let mut branch_tys = vec![];
            for branch in branches.iter_mut() {
                let CaseBranch {
                    pattern,
                    branch_expr,
                } = branch;
                let mut branch_scope = scope.clone();
                extend_scope_for_pattern(pattern, &mut branch_scope, &expr_ty, type_var_assigns)?;
                let branch_ty = type_check_expr(branch_expr, &mut branch_scope, type_var_assigns)?;
                branch_tys.push(branch_ty);
            }

            if branch_tys
                .iter()
                .all(|ty| type_var_assigns.assign_or_check(&branch_tys[0], ty))
            {
                Ok(branch_tys[0].clone())
            } else {
                Err(format!("Branches have different types {:#?}", branch_tys))
            }
        }
        Expression::LambdaAbstraction(_, _) => unimplemented!("Lambda abstraction"),
    };

    flatten_function_ty(&res?)
}

/// Flattens a function type recursively and returns the flattened type.
///
/// The function type is flattened by removing the nested function types and concatenating the
/// parameters and return types. For example, the type `Int -> ((Char -> Bool) -> (Bool -> Int))` is flattened
/// to `Int -> (Char -> Bool) -> Bool -> Int`.
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
