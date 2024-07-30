module Parser where

import Lexer

data Expr
  = Num Int
  | Add Expr Expr
  | Mul Expr Expr
  deriving (Show, Eq)

parse :: [Token] -> Expr
parse tokens = let (expr, _) = parseExpr tokens in expr

parseExpr :: [Token] -> (Expr, [Token])
parseExpr tokens =
  let (term, tokens') = parseTerm tokens
   in parseExpr' term tokens'

parseExpr' :: Expr -> [Token] -> (Expr, [Token])
parseExpr' term (TPlus : tokens) =
  let (term', tokens') = parseTerm tokens
   in parseExpr' (Add term term') tokens'
parseExpr' term tokens = (term, tokens)

parseTerm :: [Token] -> (Expr, [Token])
parseTerm tokens =
  let (factor, tokens') = parseFactor tokens
   in parseTerm' factor tokens'

parseTerm' :: Expr -> [Token] -> (Expr, [Token])
parseTerm' factor (TStar : tokens) =
  let (factor', tokens') = parseFactor tokens
   in parseTerm' (Mul factor factor') tokens'
parseTerm' factor tokens = (factor, tokens)

parseFactor :: [Token] -> (Expr, [Token])
parseFactor (TNumber n : tokens) = (Num n, tokens)
parseFactor tokens = error $ "Unexpected token: " ++ show tokens
