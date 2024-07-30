module FindShortest where

import Data.List (foldl')

findShortest :: String -> Integer
findShortest xs = foldl' (\acc word -> min acc (toInteger (length word))) (toInteger (maxBound :: Int)) (words xs)

main :: IO ()
main = print $ findShortest "try me punk"
