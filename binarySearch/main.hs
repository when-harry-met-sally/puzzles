binarySearch :: (Eq a, Ord a) => [a] -> a -> Int
binarySearch arr target = go arr target 0 (length arr - 1)
  where
    go :: (Eq a, Ord a) => [a] -> a -> Int -> Int -> Int
    go arr target left right
      | left > right = -1
      | otherwise =
          let mid = (left + right) `div` 2
           in case compare (arr !! mid) target of
                LT -> go arr target (mid + 1) (right)
                GT -> go arr target (left) (mid - 1)
                EQ -> mid

main :: IO ()
main = print $ binarySearch [1, 2, 3, 4, 5] 6
