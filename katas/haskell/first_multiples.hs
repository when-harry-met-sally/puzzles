module Multiples where

multiples :: Int -> Int -> [Int]
multiples i x = _multiples i 0 x []

_multiples :: Int -> Int -> Int -> [Int] -> [Int]
_multiples i j x arr
  | j == i = reverse arr
  | otherwise = _multiples i (j + 1) x (x * (j + 1) : arr)

main :: IO ()
main = print $ multiples 3 5
