// SPDX-License-Identifier: MIT

//! Parser module contains the parser and lexer for the Waskell programming language.

use logos::{Lexer, Logos};

use std::iter::Peekable;

/// A lexer for the Waskell programming language.
#[derive(Logos, Debug, Clone, PartialEq)]
#[logos(skip r"\s+")]
pub enum Token {
    // any string that starts with a lowercase letter or _ and is followed by any word character (a-z, A-Z, 0-9, _) or '
    #[regex(r"[[[:lower:]]_][[:word:]]*", |lex| lex.slice().to_owned())]
    VariableIdent(String),

    // any string that starts with an uppercase letter and is followed by any word character (a-z, A-Z, 0-9, _) or '
    #[regex(r"[[:upper:]][[[:word:]]']*", |lex| lex.slice().to_owned())]
    ConstructorIdent(String),

    /// Reserved identifiers
    #[regex(r"case|class|data|default|deriving|do|else|foreign|if|import|in|infix|infixl|infixr|instance|let|module|
            newtype|of|then|type|where|_", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedIdent(String),

    #[regex(r"\.\.|:|::|=|\\|\||<-|->|@|~|=>", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedOperator(String),

    // any string of symbol characters (punctuation, math, etc.) that does not start with a colon
    #[regex(r#"[\pS\pP--[_"'\(),;\[\]`\{}:]][\pS\pP--[_"'\(),;\[\]`\{}]]*"#,
            |lex| lex.slice().to_owned(), priority = 50)]
    VariableSym(String),

    /// Constructor symbols
    // any string that starts with a colon and is followed by any symbol character (punctuation, math, etc.)
    #[regex(r#":[\pS\pP--[_"'\(),;\[\]`\{}]]*"#, |lex| lex.slice().to_owned(), priority = 50)]
    ConstructorSym(String),

    #[regex(r"[\(),;\[\]`\{}]", |lex| lex.slice().chars().next().unwrap(), priority = 200)]
    Special(char),

    #[regex(r"\d+", |lex| lex.slice().parse::<i64>().unwrap())]
    Integer(i64),

    // TODO: floating point numbers
    // TODO: escape sequences
    // TODO: layout rule
    #[regex(r#"'.*'"#, |lex| lex.slice().chars().nth(1).unwrap())]
    Char(char),

    #[regex(r#""[^"]*""#, |lex| lex.slice()[1..lex.slice().len()-1].to_owned())]
    String(String),
}

type TokenIter<'a> = Peekable<Lexer<'a, Token>>;

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

// TODO: labeled fields on constructors??

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
                _ => Err(format!("Unexpected token: {}", ident)),
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
            _ => Err(format!("Unexpected token: {:?}", token)),
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
                _ => break,
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
                _ => Err(format!("Unexpected token: {}", ident)),
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
                    match next_token(input, true)? {
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
    //ParenthesizedExpr(Box<Expression>),
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
            Token::Special('(') => {
                match next_token(input, false)? {
                    Token::VariableSym(op) => match next_token(input, false)? {
                        Token::Special(')') => Ok(FunctionParameterExpression::Variable(op)),
                        t => {
                            // TODO: right section here
                            Err(format!("Expected ')', got {:?}", t))
                        }
                    },
                    t => {
                        // TODO: handle tuple etc. here
                        Err(format!("Expected variable symbol, got {:?}", t))
                    }
                }
            }
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
