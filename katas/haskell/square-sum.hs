module SquareSum where

squareSum :: [Integer] -> Integer
squareSum = foldl (\acc n -> acc + n * n) 0

main :: IO ()
main = print $ squareSum [1, 2, 2]
