module FindMaximumAndMinimumValuesOfAList where

minimums :: [Int] -> Int
minimums = foldl1 (\acc n -> if n < acc then n else acc)

maximums :: [Int] -> Int
maximums = foldl1 (\acc n -> if n > acc then n else acc)

main :: IO ()
main = print $ minimums [1, 2, 3, 4]
