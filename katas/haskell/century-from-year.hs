module Century where

century :: Int -> Int
century year
  | c == 0 = d
  | otherwise = d + 1
  where
    c = year `mod` 100
    d = year `div` 100

main :: IO ()
main = print $ century 1900
