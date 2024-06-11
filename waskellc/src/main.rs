use waskellc::Token;

use logos::Logos;

use std::fs;

fn main() {
    let file_contents = fs::read_to_string("examples/x_square.wsk").unwrap();

    let lex = Token::lexer(&file_contents);

    lex.into_iter().for_each(|token| {
        println!("{:?}", token);
    });
}
