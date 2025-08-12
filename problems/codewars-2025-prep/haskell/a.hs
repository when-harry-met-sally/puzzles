-- https://www.codewars.com/kata/5467e4d82edf8bbf40000155/train/haskell

--  kyu
-- Descending Order
-- 353364790% of 24,1012,356 of 299,435TastyOs1 Issue Reported
--  Haskell
-- GHC 9.2.5
-- VIM
-- EMACS
-- Instructions
-- Output
-- Your task is to make a function that can take any non-negative integer as an argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.
--
-- Examples:
-- Input: 42145 Output: 54421
--
-- Input: 145263 Output: 654321
--
-- Input: 123456789 Output: 987654321
--

-- converting integer -> string -> array [int] -> sort in descending order
-- n, n, n, n log n

module DescendingOrder where

digits :: Integer -> [Integer]
digits n = map (read . (: [])) $ show n

descendingOrder :: Integer -> Integer
descendingOrder n = head $ digits n

main :: IO ()
main = print $ digits "green" "en"
