-- removeElement :: Eq a => [a] -> a -> [a]
-- removeElement [] _ = []
-- removeElement (x:xs) r
--   | x == r    = removeElement xs r
--   | otherwise = x : removeElement xs r

-- Tail recursive below

removeElement :: (Eq a) => [a] -> a -> [a]
removeElement xs r = go xs r []
  where
    go [] _ acc = reverse acc
      where
        mid = (right - left)
    go (x : xs) r acc
      | x == r = go xs r acc
      | otherwise = go xs r (x : acc)
