import Data.List (sort, sortBy)
import qualified Data.Map.Strict as Map
import Data.Ord (comparing)

type IntMap = Map.Map Int Int

topKfrequent :: [Int] -> IntMap
topKfrequent arr = _topKfrequent arr Map.empty
  where
    _topKfrequent :: [Int] -> IntMap -> IntMap
    _topKfrequent [] m = m
    _topKfrequent (x : xs) m =
      case Map.lookup (x) m of
        Just j -> _topKfrequent xs (Map.insert x (j + 1) m)
        Nothing -> _topKfrequent xs (Map.insert x 1 m)

main :: IO ()
main = do
  print $ map fst (take 3 $ sortBy (flip $ comparing snd) $ Map.toList $ topKfrequent [1, 9, 3, 3, 4, 5, 5, 5, 5])

-- import Data.List (sortBy)
-- import qualified Data.Map.Strict as Map
-- import Data.Ord (comparing)
-- import Data.Maybe (fromMaybe)
--
-- type IntMap = Map.Map Int Int
--
-- -- Function to maintain top k elements
-- insertTopK :: Ord b => Int -> [(a, b)] -> (a, b) -> [(a, b)]
-- insertTopK k xs x
--   | length xs < k = x : xs
--   | otherwise = let (minElem:rest) = sortBy (comparing snd) (x:xs)
--                 in if snd x > snd minElem then x : rest else minElem : rest
--
-- topKfrequent :: [Int] -> IntMap
-- topKfrequent arr = foldl updateFreq Map.empty arr
--   where
--     updateFreq m x = Map.insert x (fromMaybe 0 (Map.lookup x m) + 1) m
--
-- getTopK :: Int -> IntMap -> [(Int, Int)]
-- getTopK k m = foldl (insertTopK k) [] (Map.toList m)
--
-- main :: IO ()
-- main = do
--   let frequencyMap = topKfrequent [1, 9, 3, 3, 4, 5, 5, 5, 5]
--   let top3 = map fst (getTopK 3 frequencyMap)
--   print top3
