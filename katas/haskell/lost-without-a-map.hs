module Codewars.Kata.LostWithout where

maps :: [Int] -> [Int]
maps xs = [x * 2 | x <- xs]

main :: IO ()
main = print $ maps [1, 2, 3]
