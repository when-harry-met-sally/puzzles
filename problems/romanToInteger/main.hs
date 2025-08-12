-- import Control.Exception (Exception, catch, throw)
-- import Data.Map.Strict (Map)
-- import qualified Data.Map.Strict as Map
--
-- -- Define a custom error for missing keys
-- data KeyError = KeyError String deriving (Show)
--
-- instance Exception KeyError
--
-- lookupOrThrow :: (Ord k, Show k) => k -> Map.Map k a -> a
-- lookupOrThrow key map = case Map.lookup key map of
--   Just value -> value
--   Nothing -> throw (KeyError $ "Key not found: " ++ show key)
--
-- type StringIntMap = Map.Map Char Int
--
-- romans :: StringIntMap
-- romans = Map.fromList [('I', 1), ('V', 5), ('X', 10), ('L', 50), ('C', 100), ('D', 500), ('M', 1000)]
--
-- romanToInt :: String -> Int
-- romanToInt r = tally r 0
--   where
--     tally :: String -> Int -> Int
--     tally [] n = n
--     tally [x] n = n + lookupOrThrow x romans
--     tally (x : y : xs) n
--       | x >= y = tally (y : xs) n + lookupOrThrow x romans
--       | otherwise = tally (xs) n + (lookupOrThrow y romans) - (lookupOrThrow x romans)
--
-- main :: IO ()
-- main = do
--   print $ romanToInt "XI"

-- Above is y solution.

import Control.Exception (Exception, catch, throw)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

-- Define a custom error for missing keys
data KeyError = KeyError String deriving (Show)

instance Exception KeyError

lookupOrThrow :: (Ord k, Show k) => k -> Map.Map k a -> a
lookupOrThrow key map = case Map.lookup key map of
  Just value -> value
  Nothing -> throw (KeyError $ "Key not found: " ++ show key)

type StringIntMap = Map.Map Char Int

romans :: StringIntMap
romans = Map.fromList [('I', 1), ('V', 5), ('X', 10), ('L', 50), ('C', 100), ('D', 500), ('M', 1000)]

romanToInt :: String -> Int
romanToInt r = tally r 0
  where
    tally :: String -> Int -> Int
    tally [] n = n
    tally [x] n = n + lookupOrThrow x romans
    tally (x : y : xs) n
      | lookupOrThrow x romans >= lookupOrThrow y romans = tally (y : xs) (n + lookupOrThrow x romans)
      | otherwise = tally xs (n + lookupOrThrow y romans - lookupOrThrow x romans)

main :: IO ()
main =
  do
    print $ romanToInt "XI" -- Should print 11
    print $ romanToInt "IX" -- Should print 9
    print $ romanToInt "MCMXCIV" -- Should print 1994
    `catch` \(KeyError msg) -> putStrLn $ "Error: " ++ msg

-- Solution where we use let
-- romanToInt :: String -> Int
-- romanToInt r = tally r 0
--   where
--     tally :: String -> Int -> Int
--     tally [] n = n
--     tally [x] n = n + lookupOrThrow x romans
--     tally (x : y : xs) n =
--       let
--         valueX = lookupOrThrow x romans
--         valueY = lookupOrThrow y romans
--       in
--         if valueX >= valueY
--           then tally (y : xs) (n + valueX)
--           else tally xs (n + valueY - valueX)
