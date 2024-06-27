module Fact where

fact :: Int -> Int
fact x
  | x <= 1 = 1
  | otherwise = x * fact (x - 1)

main :: IO ()
main = print $ fact 10
