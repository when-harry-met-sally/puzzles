remove :: (Eq a) => [a] -> [a]
remove arr = go arr []
  where
    go :: (Eq a) => [a] -> [a] -> [a]
    go [] acc = reverse acc
    go [x] acc = reverse (x : acc)
    go (x : y : xs) acc
      | x == y = go (y : xs) acc
      | otherwise = go (y : xs) (x : acc)

main :: IO ()
main =
  do
    print $ remove [1, 1, 1, 1, 2, 3, 3]
