module HowGoodAreYou where

betterThanAverage :: [Int] -> Int -> Bool
betterThanAverage x y = (sum x) `div` (length x) < y

main :: IO ()
main = print $ betterThanAverage [1, 2, 3] 2
