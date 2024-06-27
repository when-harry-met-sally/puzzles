module Codewars.G964.Accumule where

import Data.Char
import Data.List

accum :: [Char] -> [Char]
accum x = _accum x []

_accum :: [Char] -> [Char] -> [Char]
_accum (x : y : xs) r
  | xs == [] = r
  | x == y || x == toUpper y = _accum (y : xs) (r ++ [x])
  | otherwise = _accum (y : xs) (r ++ [toUpper x, '-'])

main :: IO ()
main =
  print $
    accum "abcdeeef"

rep :: Int -> Char -> String
rep 0 c = [toUpper c]
