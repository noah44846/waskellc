// SPDX-License-Identifier: MIT

use logos::Logos;

use crate::parser::lexer::{Token, TokenIter};

fn next_token(iter: &mut TokenIter, peek: bool) -> Result<Token, String> {
    let next = if peek {
        iter.peek().cloned()
    } else {
        iter.next()
    };
    match next {
        Some(token) => match token {
            Ok(token) => Ok(token),
            Err(_) => Err("Error parsing token".to_string()),
        },
        None => Err("Unexpected end of input".to_string()),
    }
}

#[allow(dead_code)]
#[derive(Debug)]
pub struct TopDeclarations(pub Vec<TopDeclaration>);

impl TopDeclarations {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let mut top_declarations = vec![];
        loop {
            top_declarations.push(TopDeclaration::parse(input)?);

            if input.peek().is_none() {
                break;
            }

            match next_token(input, true)? {
                Token::Special(';') => {
                    input.next(); // consume the ';'
                }
                t => {
                    return Err(format!("Unexpected token {:?} after declaration", t));
                }
            }
        }

        Ok(TopDeclarations(top_declarations))
    }
}

#[derive(Debug)]
pub enum TopDeclaration {
    //TypeDecl(TypeDeclaration),
    //DataDecl(DataDeclaration),
    //NewTypeDecl(NewTypeDeclaration),
    //FixityDecl(FixityDeclaration),
    // may be a list of type variables
    TypeSig(String, FunctionType),
    FunctionDecl(FunctionDeclaration),
}

impl TopDeclaration {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let token = next_token(input, false)?;
        match token {
            Token::ReservedIdent(ident) => match ident.as_str() {
                "type" => {
                    unimplemented!()
                }
                "data" => {
                    unimplemented!()
                }
                "newtype" => {
                    unimplemented!()
                }
                _ => Err(format!("Unexpected keyword: {}", ident)),
            },
            // TODO: support (&*) as variables
            Token::VariableIdent(ident) => match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "::" => {
                    input.next(); // consume the '::'
                    Ok(TopDeclaration::TypeSig(ident, FunctionType::parse(input)?))
                }
                _ => Ok(TopDeclaration::FunctionDecl(FunctionDeclaration::parse(
                    ident, input,
                )?)),
            },
            _ => Err(format!("Unexpected token for top declaration: {:?}", token)),
        }
    }
}

#[allow(dead_code)]
#[derive(Debug)]
pub struct FunctionType(pub Vec<Type>);

impl FunctionType {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let mut types = vec![];
        loop {
            types.push(Type::parse(input)?);
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "->" => {
                    input.next(); // consume the '->'
                    continue;
                }
                _ => {
                    break;
                }
            }
        }

        Ok(FunctionType(types))
    }
}

#[allow(dead_code)]
#[derive(Debug)]
pub struct Type(pub Vec<TypeApplicationElement>);

impl Type {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, false)? {
            Token::ConstructorIdent(ident) => {
                let elements = vec![TypeApplicationElement::TypeConstructor(ident)];
                Ok(Type(elements))
            }
            t => Err(format!("Expected type constructor, got {:?}", t)),
        }
    }
}

#[derive(Debug)]
pub enum TypeApplicationElement {
    //Unit,
    //ListConstructor,
    //TupleConstructor(i32),
    //FunctionConstructor,
    //ListType(Box<Type>),
    //TupleType(Vec<Type>),
    //TypeVariable(String),
    //ParenthesizedType(Box<Type>),
    TypeConstructor(String),
}

#[derive(Debug)]
pub struct FunctionDeclaration {
    // TODO: operator definitions
    // TODO: where clauses
    // TODO: guards
    pub name: String,
    pub lhs: Vec<FunctionParameterPattern>,
    pub rhs: Expression,
    //pub guards: Vec<Guard>,
}

impl FunctionDeclaration {
    fn parse(name: String, input: &mut TokenIter) -> Result<Self, String> {
        let mut lhs = vec![];
        let next = next_token(input, true)?;
        if let Token::ReservedOperator(op) = next {
            if op == "=" {
                input.next(); // consume the '='
                let rhs = Expression::parse(input)?;
                return Ok(FunctionDeclaration { name, lhs, rhs });
            }
        }

        loop {
            lhs.push(FunctionParameterPattern::parse(input)?);
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "=" => {
                    input.next(); // consume the '='
                    break;
                }
                _ => continue,
            }
        }

        Ok(FunctionDeclaration {
            name,
            lhs,
            rhs: Expression::parse(input)?,
        })
    }
}

#[derive(Debug)]
pub enum FunctionParameterPattern {
    AsPattern(String, Option<Box<FunctionParameterPattern>>),
    //ConstructorPattern(String),
    //UnitPattern,
    //EmptyListPattern,
    //EmptyTuplePattern(i32),
    //StringLiteral(String),
    //IntegerLiteral(i64),
    //CharLiteral(char),
    //Wildcard,
    //ParenthesizedPattern(Box<Pattern>),
    //TuplePattern(Vec<Pattern>),
    //ListPattern(Vec<Pattern>),
    //NegatedIntegerLiteral(i64),
}

impl FunctionParameterPattern {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        use FunctionParameterPattern::*;

        match next_token(input, false)? {
            Token::VariableIdent(ident) => {
                match next_token(input, true)? {
                    Token::Special('@') => {
                        input.next(); // consume the '@'
                        Ok(AsPattern(
                            ident,
                            Some(Box::new(FunctionParameterPattern::parse(input)?)),
                        ))
                    }
                    _ => Ok(AsPattern(ident, None)),
                }
            }
            t => Err(format!("Expected variable identifier, got {:?}", t)),
        }
    }
}

#[allow(dead_code)]
#[derive(Debug)]
pub enum Pattern {
    FunctionParameterPattern(FunctionParameterPattern),
    ConstructorPattern(String, Vec<FunctionParameterPattern>),
    //InfixConstructorPattern(String, Box<Pattern>, Box<Pattern>),
}

#[derive(Debug)]
pub enum Expression {
    InfixedApplication(Box<LeftHandSideExpression>, String, Box<Expression>),
    NegatedExpr(Box<Expression>),
    LeftHandSideExpression(Box<LeftHandSideExpression>),
}

impl Expression {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, true)? {
            Token::VariableSym(sym) if sym == "-" => {
                input.next(); // consume the '-'
                Ok(Expression::NegatedExpr(Box::new(Expression::parse(input)?)))
            }
            _ => {
                let lhs = Box::new(LeftHandSideExpression::parse(input)?);

                if input.peek().is_none() {
                    return Ok(Expression::LeftHandSideExpression(lhs));
                }

                let op = match next_token(input, true)? {
                    Token::VariableSym(op) | Token::ConstructorSym(op) => {
                        input.next(); // consume the operator
                        op
                    }
                    Token::ReservedOperator(op) if op == ":" => {
                        input.next(); // consume the operator
                        op
                    }
                    Token::Special('`') => {
                        input.next(); // consume the '`'
                        match next_token(input, false)? {
                            Token::VariableIdent(op) => match next_token(input, false)? {
                                Token::Special('`') => op,
                                t => {
                                    return Err(format!(
                                        "Expected variable identifier, got {:?}",
                                        t
                                    ))
                                }
                            },
                            t => return Err(format!("Expected variable identifier, got {:?}", t)),
                        }
                    }
                    _ => return Ok(Expression::LeftHandSideExpression(lhs)),
                };

                Ok(Expression::InfixedApplication(
                    lhs,
                    op,
                    Box::new(Expression::parse(input)?),
                ))
            }
        }
    }
}

#[derive(Debug)]
pub enum LeftHandSideExpression {
    FunctionApplication(Vec<FunctionParameterExpression>),
    //LambdaExpr(Vec<Pattern>, Box<Expression>),
    //LetExpr(Vec<Declarations>, Box<Expression>), // make a group of function decls and type sigs under
    //tobdecls
    //IfExpr(Box<Expression>, Box<Expression>, Box<Expression>),
    //CaseExpr(Box<Expression>, Vec<CaseAlternative>),
}

impl LeftHandSideExpression {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, true)? {
            Token::ReservedIdent(ident) => match ident.as_str() {
                "let" => {
                    input.next(); // consume the 'let'
                    unimplemented!()
                }
                "if" => {
                    input.next(); // consume the 'if'
                    unimplemented!()
                }
                "case" => {
                    input.next(); // consume the 'case'
                    unimplemented!()
                }
                _ => Err(format!("Unexpected token for expression: {}", ident)),
            },
            Token::ReservedOperator(op) if op == "\\" => {
                input.next(); // consume the '\\'
                unimplemented!()
            }
            _ => {
                let mut params = vec![];
                loop {
                    params.push(FunctionParameterExpression::parse(input)?);
                    if input.peek().is_none() {
                        break;
                    }

                    let next = next_token(input, true)?;
                    if let Token::Special(';') = next {
                        break;
                    }

                    match next {
                        Token::Special('(')
                        | Token::Special('[')
                        | Token::VariableIdent(_)
                        | Token::String(_)
                        | Token::Integer(_)
                        | Token::Char(_) => continue,
                        _ => break,
                    }
                }
                Ok(LeftHandSideExpression::FunctionApplication(params))
            }
        }
    }
}

#[derive(Debug)]
pub enum FunctionParameterExpression {
    StringLiteral(String),
    IntegerLiteral(i64),
    CharLiteral(char),
    Variable(String),
    //Constructor(String),
    //EmptyList,
    //EmptyTuple(i32),
    ParenthesizedExpr(Box<Expression>),
    //TupleExpr(Vec<Expression>),
    //ListExpr(Vec<Expression>),
    //ArithmeticSequence(Box<Expression>, Option<Box<Expression>>, Option<Box<Expression>>),
    //ListComprehension(Box<Expression>, ...),
    //LeftSection(String, Box<Expression>),
    //RightSection(Box<Expression>, String),
}

impl FunctionParameterExpression {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, false)? {
            Token::VariableIdent(ident) => Ok(FunctionParameterExpression::Variable(ident)),
            Token::Special('(') => match next_token(input, true)? {
                Token::VariableSym(op) if op != "-" => {
                    input.next(); // consume the operator
                    match next_token(input, false)? {
                        Token::Special(')') => Ok(FunctionParameterExpression::Variable(op)),
                        t => Err(format!("Expected ')', got {:?}", t)),
                    }
                }
                _ => {
                    let expr = Expression::parse(input)?;
                    match next_token(input, false)? {
                        Token::Special(')') => Ok(FunctionParameterExpression::ParenthesizedExpr(
                            Box::new(expr),
                        )),
                        Token::Special(',') => todo!(),
                        t => Err(format!("Expected ')', got {:?}", t)),
                    }
                }
            },
            Token::Special('[') => {
                unimplemented!()
            }
            Token::String(s) => Ok(FunctionParameterExpression::StringLiteral(s)),
            Token::Integer(i) => Ok(FunctionParameterExpression::IntegerLiteral(i)),
            Token::Char(c) => Ok(FunctionParameterExpression::CharLiteral(c)),
            t => Err(format!("Expected variable identifier, got {:?}", t)),
        }
    }
}

pub fn parse(input: &str) -> Result<TopDeclarations, String> {
    let mut tokens = Token::lexer(input).peekable();

    TopDeclarations::parse(&mut tokens)
}
