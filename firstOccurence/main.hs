-- import Data.List (isPrefixOf)
--
-- firstOccurance :: String -> String -> Bool
-- firstOccurance [] _ = False
-- firstOccurance m@(x : xs) y
--   | isPrefixOf m y = True
--   | otherwise = firstOccurance (xs) y
--
-- main :: IO ()
-- main = print $ firstOccurance "test" "txests"

import Data.List (isPrefixOf)

firstOccurrence :: String -> String -> Bool
firstOccurrence _ [] = False
firstOccurrence m y@(x : xs)
  | isPrefixOf m y = True
  | otherwise = firstOccurrence m xs

main :: IO ()
main = print $ firstOccurrence "test" "txests"
