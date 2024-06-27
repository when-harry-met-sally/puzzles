module Bus where

number :: [(Int, Int)] -> Int
number x = foldl (\acc (a, b) -> acc + a - b) 0 x

main :: IO ()
main = print $ number [(3, 0), (2, 1), (5, 2)]
