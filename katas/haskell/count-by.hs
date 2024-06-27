module Count where

countBy :: Integer -> Int -> [Integer]
countBy x n = take n [i * x | i <- [1 ..]]

main :: IO ()
main = print $ countBy 2 5
