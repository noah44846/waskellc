// SPDX-License-Identifier: MIT

use std::iter::Peekable;

use logos::{Lexer, Logos};

/// A lexer for the Waskell programming language.
#[derive(Logos, Debug, Clone, PartialEq)]
#[logos(error = String)]
#[logos(skip r"\s+")]
pub enum Token {
    // any string that starts with a lowercase letter or _ and is followed by any word character (a-z, A-Z, 0-9, _) or '
    /// Variable identifiers
    #[regex(r"[[[:lower:]]_][[[:word:]]']*", |lex| lex.slice().to_owned())]
    VariableIdent(String),

    // any string that starts with an uppercase letter and is followed by any word character (a-z, A-Z, 0-9, _) or '
    /// Constructor identifiers
    #[regex(r"[[:upper:]][[[:word:]]']*", |lex| lex.slice().to_owned())]
    ConstructorIdent(String),

    /// Reserved identifiers
    #[regex(r"case|class|data|default|deriving|do|else|foreign|if|import|in|infix|infixl|infixr|instance|let|module|
            newtype|of|then|type|where|_", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedIdent(String),

    /// Reserved operators
    #[regex(r"\.\.|:|::|=|\\|\||<-|->|@|~|=>", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedOperator(String),

    // any string of symbol characters (punctuation, math, etc.) that does not start with a colon
    /// Variable symbols
    #[regex(r#"[\pS\pP--[_"'\(),;\[\]`\{}:]][\pS\pP--[_"'\(),;\[\]`\{}]]*"#,
            |lex| lex.slice().to_owned(), priority = 50)]
    VariableSym(String),

    // any string that starts with a colon and is followed by any symbol character (punctuation, math, etc.)
    /// Constructor symbols
    #[regex(r#":[\pS\pP--[_"'\(),;\[\]`\{}]]*"#, |lex| lex.slice().to_owned(), priority = 50)]
    ConstructorSym(String),

    /// Special characters
    #[regex(r"[\(),;\[\]`\{}]", |lex| lex.slice().chars().next().unwrap(), priority = 200)]
    Special(char),

    /// Integer literals
    #[regex(r"\d+", |lex| lex.slice().parse::<i32>().unwrap())]
    Integer(i32),

    /// Char literals
    #[regex(r#"'[^']'"#, |lex| lex.slice().chars().nth(1).unwrap())]
    Char(char),

    /// String literals
    #[regex(r#""[^"]*""#, |lex| lex.slice()[1..lex.slice().len()-1].to_owned())]
    String(String),

    /// Line comments - ignored
    #[regex(r"--[^\n]*", logos::skip)]
    LineComment,

    /// Block comments - ignored
    #[regex(r"\{-[^-}]*-}", logos::skip)]
    BlockComment,
}

pub type TokenIter<'a> = Peekable<Lexer<'a, Token>>;
