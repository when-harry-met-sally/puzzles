module GetSum where

getSum :: Int -> Int -> Int
getSum x y = sum [(min x y) .. (max x y)]
