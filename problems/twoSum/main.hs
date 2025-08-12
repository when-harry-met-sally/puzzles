module TwoSum where

import qualified Data.Map.Strict as Map

type Memo = Map.Map Int Int

twoSum :: [Int] -> Int -> Int -> Memo -> Maybe (Int, Int)
twoSum arr target i m
  | i >= length arr = Nothing -- No solution found, return Nothing
  | otherwise = case Map.lookup y m of
      Just j -> Just (j, i)
      Nothing -> twoSum arr target (i + 1) (Map.insert z i m)
  where
    y = arr !! i
    z = target - y

main :: IO ()
main = print $ twoSum [1, 2, 3, 4, 5] 5 0 Map.empty
