// SPDX-License-Identifier: MIT

//! This module for doing type checking and other validations on the AST of the Waskell programming language.

use std::{cell::RefCell, collections::HashMap, fmt, rc::Rc};

use crate::parser;
use crate::validator::type_check::type_check_expr;

pub type SymbolTable = HashMap<String, Rc<RefCell<Symbol>>>;

#[derive(PartialEq, Clone)]
pub struct Symbol {
    pub name: String,
    pub ty: Type,
    pub expr: Option<Expression>,
    pub scope: Option<Rc<RefCell<Symbol>>>,
}

impl fmt::Debug for Symbol {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Symbol {{ name: {}, ty: {:?}, expr: {:#?} }}",
            self.name, self.ty, self.expr
        )
    }
}

impl Symbol {
    fn param_type(&self, i: usize) -> Option<&Type> {
        match self.ty {
            // lase argument is the return type
            Type::Function(ref params) if i < params.len() - 1 => params.get(i),
            _ => None,
        }
    }

    pub fn return_type(&self) -> Option<&Type> {
        match self.ty {
            Type::Function(ref params) => params.last(),
            _ => Some(&self.ty),
        }
    }

    pub fn arity(&self) -> u8 {
        match self.ty {
            Type::Function(ref params) => (params.len() - 1) as u8,
            _ => 0,
        }
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Type {
    Int,
    Float,
    Boolean,
    Char,
    String,
    Function(Vec<Type>),
    List(Box<Type>),
    Tuple(Vec<Type>),
    Unit,
    // custom type
}

#[derive(Debug, PartialEq, Clone)]
pub enum Expression {
    IntLiteral(i64),
    FloatLiteral(f64),
    StringLiteral(String),
    CharLiteral(char),
    Symbol(Rc<RefCell<Symbol>>),
    FunctionApplication(Vec<Expression>),
    LambdaAbstraction(Vec<String>, Box<Expression>),
    // case expression...
}

fn parser_type_to_type(parser_type: parser::Type) -> Result<Type, String> {
    // TODO: add support for type applications
    for ty in &parser_type.0 {
        match ty {
            parser::TypeApplicationElement::TypeConstructor(ty_con) => match ty_con.as_str() {
                "Int" => return Ok(Type::Int),
                "Float" => return Ok(Type::Float),
                "Boolean" => return Ok(Type::Boolean),
                "Char" => return Ok(Type::Char),
                "String" => return Ok(Type::String),
                _ => todo!(),
            },
        }
    }
    Err("No type found".to_string())
}

fn function_type_to_symbol(
    name: String,
    func_ty: parser::FunctionType,
    symbol_table: &mut SymbolTable,
) -> Result<(), String> {
    let tys = func_ty
        .0
        .into_iter()
        .map(parser_type_to_type)
        .collect::<Result<Vec<Type>, String>>()?;

    symbol_table.insert(
        name.clone(),
        Rc::new(RefCell::new(Symbol {
            name,
            ty: Type::Function(tys),
            expr: None,
            scope: None,
        })),
    );
    Ok(())
}

fn parser_expr_to_expr(
    parser_expr: parser::Expression,
    context: &Symbol,
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match parser_expr {
        parser::Expression::InfixedApplication(lhs, op, rhs) => {
            let lhs_expr = parser_lhs_expr_to_expr(*lhs, context, symbol_table)?;
            let rhs_expr = parser_expr_to_expr(*rhs, context, symbol_table)?;
            let op = symbol_table
                .get(&op.to_string())
                .ok_or(format!("Operator {} not found", op))?;
            Ok(Expression::FunctionApplication(vec![
                Expression::Symbol(op.clone()),
                lhs_expr,
                rhs_expr,
            ]))
        }
        parser::Expression::NegatedExpr(expr) => {
            let expr = parser_expr_to_expr(*expr, context, symbol_table)?;
            let negate = symbol_table
                .get("negate")
                .ok_or("negate function not found")?;
            Ok(Expression::FunctionApplication(vec![
                Expression::Symbol(negate.clone()),
                expr,
            ]))
        }
        parser::Expression::LeftHandSideExpression(lhs) => {
            parser_lhs_expr_to_expr(*lhs, context, symbol_table)
        }
    }
}

fn parser_lhs_expr_to_expr(
    lhs_expr: parser::LeftHandSideExpression,
    context: &Symbol,
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match lhs_expr {
        parser::LeftHandSideExpression::FunctionApplication(mut params) => {
            if params.is_empty() {
                return Err("Function application must have at least one parameter".to_string());
            }

            if params.len() == 1 {
                let param = params.remove(0);
                return parser_fn_param_expr_to_expr(param, context, symbol_table);
            }

            let mut exprs = vec![];
            for param in params {
                let expr = parser_fn_param_expr_to_expr(param, context, symbol_table)?;
                exprs.push(expr);
            }

            Ok(Expression::FunctionApplication(exprs))
        }
    }
}

fn parser_fn_param_expr_to_expr(
    fn_arg_expr: parser::FunctionParameterExpression,
    context: &Symbol,
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match fn_arg_expr {
        parser::FunctionParameterExpression::Variable(name) => {
            if let Some(symbol) = symbol_table.get(&name) {
                // if the symbol is in some scope, recursively check if it's in the same scope as the expr
                // if there is no scope, then it is a global symbol
                if let Some(scope) = &(**symbol).borrow().scope {
                    fn recursively_check_scope(
                        context: &Symbol,
                        scope: Rc<RefCell<Symbol>>,
                    ) -> bool {
                        if *context == *(*scope).borrow() {
                            return true;
                        }

                        if let Some(s) = (*scope).borrow().scope.as_ref() {
                            return recursively_check_scope(context, s.clone());
                        }

                        false
                    }

                    if !recursively_check_scope(context, scope.clone()) {
                        return Err(format!("Symbol {} not found in scope", name));
                    }
                }

                Ok(Expression::Symbol(symbol.clone()))
            } else {
                Err(format!("Symbol {} not found", name))
            }
        }
        parser::FunctionParameterExpression::ParenthesizedExpr(expr) => {
            parser_expr_to_expr(*expr, context, symbol_table)
        }
        parser::FunctionParameterExpression::IntegerLiteral(i) => Ok(Expression::IntLiteral(i)),
        parser::FunctionParameterExpression::StringLiteral(s) => {
            Ok(Expression::StringLiteral(s.clone()))
        }
        parser::FunctionParameterExpression::CharLiteral(c) => Ok(Expression::CharLiteral(c)),
    }
}

fn add_function_decl_to_symbol(
    func_decl: parser::FunctionDeclaration,
    symbol_table: &mut SymbolTable,
) -> Result<(), String> {
    let parser::FunctionDeclaration { name, lhs, rhs } = func_decl;

    let symbol = symbol_table
        .get(&name)
        .ok_or(format!("Function type signature for {} not found", name))?;
    let symbol = symbol.clone();

    let mut sym_params = vec![];
    for (i, param) in lhs.into_iter().enumerate() {
        match param {
            parser::FunctionParameterPattern::AsPattern(name, None) => {
                let symbol_ref = (*symbol).borrow();
                let ty = symbol_ref
                    .param_type(i)
                    .ok_or(format!("Function {} has too many parameters", name))?;

                symbol_table.insert(
                    name.clone(),
                    Rc::new(RefCell::new(Symbol {
                        name: name.clone(),
                        ty: ty.clone(),
                        expr: None,
                        scope: Some(symbol.clone()),
                    })),
                );
                sym_params.push(name);
            }
            _ => todo!(),
        }
    }

    let expr = parser_expr_to_expr(rhs, &(*symbol).borrow(), symbol_table)?;
    let mut symbol_ref = (*symbol).borrow_mut();
    if sym_params.is_empty() {
        symbol_ref.expr = Some(expr);
        return Ok(());
    }
    symbol_ref.expr = Some(Expression::LambdaAbstraction(sym_params, Box::new(expr)));
    Ok(())
}

pub fn validate(ast: parser::TopDeclarations) -> Result<SymbolTable, String> {
    let mut symbol_table: SymbolTable = HashMap::new();

    // TODO: replace this with a std lib
    let global_op_symbols = [
        Symbol {
            name: "+".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            scope: None,
        },
        Symbol {
            name: "-".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            scope: None,
        },
        Symbol {
            name: "*".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            scope: None,
        },
        Symbol {
            name: "/".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            scope: None,
        },
        Symbol {
            name: "negate".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int]),
            expr: None,
            scope: None,
        },
    ];

    for symbol in global_op_symbols.iter() {
        symbol_table.insert(symbol.name.clone(), Rc::new(RefCell::new(symbol.clone())));
    }

    for decl in ast.0 {
        match decl {
            parser::TopDeclaration::TypeSig(name, ty) => {
                function_type_to_symbol(name, ty, &mut symbol_table)?;
            }
            parser::TopDeclaration::FunctionDecl(func_decl) => {
                let name = func_decl.name.clone();
                add_function_decl_to_symbol(func_decl, &mut symbol_table)?;
                let symbol = symbol_table.get(&name).unwrap();
                type_check_expr(
                    &(*symbol).borrow().expr.as_ref().unwrap().clone(),
                    &(symbol).borrow(),
                )?;
            }
        }
    }

    Ok(symbol_table)
}
