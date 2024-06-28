module Palindrome where

isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (x : xs)
  | x == last xs = isPalindrome $ init xs
  | otherwise = False

main :: IO ()
main = print $ isPalindrome "tts"

-- GPT Suggested
-- isPalindrome :: String -> Bool
-- isPalindrome xs = xs == reverse xs

-- Optimal
-- isPalindrome :: String -> Bool
-- isPalindrome xs = checkPalindrome xs 0 (length xs - 1)
--   where
--     checkPalindrome :: String -> Int -> Int -> Bool
--     checkPalindrome xs left right
--       | left >= right = True
--       | xs !! left /= xs !! right = False
--       | otherwise = checkPalindrome xs (left + 1) (right - 1)
