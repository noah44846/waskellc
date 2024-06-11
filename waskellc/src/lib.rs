use logos::{Lexer, Logos};

use std::iter::Peekable;

#[derive(Logos, Debug, Clone, PartialEq)]
#[logos(skip r"\s+")]
pub enum Token {
    // any string that starts with a lowercase letter or _ and is followed by any word character (a-z, A-Z, 0-9, _) or '
    #[regex(r"[[[:lower:]]_][[:word:]]*", |lex| lex.slice().to_owned())]
    VariableIdent(String),

    // any string that starts with an uppercase letter and is followed by any word character (a-z, A-Z, 0-9, _) or '
    #[regex(r"[[:upper:]][[[:word:]]']*", |lex| lex.slice().to_owned())]
    ConstructorIdent(String),

    #[regex(r"case|class|data|default|deriving|do|else|foreign|if|import|in|infix|infixl|infixr|instance|let|module|
            newtype|of|then|type|where|_", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedIdent(String),

    #[regex(r"\.\.|:|::|=|\\|\||<-|->|@|~|=>", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedOperator(String),

    // any string of symbol characters (punctuation, math, etc.) that does not start with a colon
    #[regex(r#"[\pS\pP--[_"'\(),;\[\]`\{}:]][\pS\pP--[_"'\(),;\[\]`\{}]]*"#, |lex| lex.slice().to_owned(), priority = 50)]
    VariableSym(String),

    // any string that starts with a colon and is followed by any symbol character (punctuation, math, etc.)
    #[regex(r#":[\pS\pP--[_"'\(),;\[\]`\{}]]*"#, |lex| lex.slice().to_owned(), priority = 50)]
    ConstructorSym(String),

    #[regex(r"[\(),;\[\]`\{}]", |lex| lex.slice().chars().next().unwrap(), priority = 200)]
    Special(char),

    #[regex(r"\d+", |lex| lex.slice().parse::<i64>().unwrap())]
    Number(i64),
    
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

#[allow(dead_code)]
#[derive(Debug)]
pub struct TopDeclarations(Vec<TopDeclaration>);

impl TopDeclarations {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let mut top_declarations = vec![];
        loop {
            top_declarations.push(TopDeclaration::parse(input)?);
            if let None = input.next() {
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
    // may be a list of type variables
    TypeSig(String, FunctionType),
    FunctionDecl(FunctionDeclaration),
}

impl TopDeclaration {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let token = next_token(input, false)?;
        match token {
            Token::ReservedIdent(ident) => {
                match ident.as_str() {
                    "type" => {
                        unimplemented!()
                    },
                    "data" => {
                        unimplemented!()
                    },
                    "newtype" => {
                        unimplemented!()
                    },
                    _ => Err(format!("Unexpected token: {}", ident)),
                }
            },
            Token::VariableIdent(ident) => {
                match next_token(input, false)? {
                    Token::ReservedOperator(op) if op == "::" =>
                        Ok(TopDeclaration::TypeSig(ident, FunctionType::parse(input)?)),
                    _ => Ok(TopDeclaration::FunctionDecl(FunctionDeclaration::parse(input)?)),
                }
            },
            _ => Err(format!("Unexpected token: {:?}", token)),
        }
    }
}

#[allow(dead_code)]
#[derive(Debug)]
pub struct FunctionType(Vec<Type>);

impl FunctionType {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        // example input: a -> b -> c
        let mut types = vec![];
        loop {
            types.push(Type::parse(input)?);
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "->" => {
                    input.next(); // consume the operator
                    continue
                },
                _ => break,
            }
        }
        
        Ok(FunctionType(types))
    }
}

#[allow(dead_code)]
#[derive(Debug)]
pub struct Type(Vec<TypeApplicationElement>);

impl Type {
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, false)? {
            Token::ConstructorIdent(ident) => {
                let elements = vec![TypeApplicationElement::TypeConstructor(ident)];
                Ok(Type(elements))
            },
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
    /*pub name: String,*/
    /*pub args: Vec<String>,*/
    /*pub body: Expr,*/
}

impl FunctionDeclaration {
    fn parse(_input: &mut TokenIter) -> Result<Self, String> {
        unimplemented!("FunctionDeclaration::parse")
    }
}

pub fn parse(input: String) {
    let mut tokens = Token::lexer(input.as_str()).peekable();

    let top_declarations = TopDeclarations::parse(&mut tokens);

    println!("{:?}", top_declarations);
}
