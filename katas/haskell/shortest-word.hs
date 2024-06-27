module FindShortest where

import Data.List (foldl')

find_shortest :: String -> Integer
find_shortest xs = foldl' (\acc word -> min acc (toInteger (length word))) (toInteger (maxBound :: Int)) (words xs)

main :: IO ()
main = print $ find_shortest "try me punk"
