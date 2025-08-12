-- Valid Parens
-- Stack, essentially: if you try to close a stack that isn't the last open one, error. if you end, and have a nonempty stack. False
import qualified Data.Map.Strict as Map

type ParenMap = Map.Map Char Char

openers :: ParenMap
openers = Map.fromList [(')', '('), ('}', '{'), (']', '[')]

validParens :: String -> Bool
validParens str = go str []
  where
    go :: String -> String -> Bool
    go [] stack = length stack == 0
    go (x : xs) stack =
      let closer = Map.lookup x openers
          cur = last stack
       in case closer of
            Just j -> if length stack > 0 && cur == j then go xs (init stack) else False
            Nothing -> go xs (stack ++ [x])

main :: IO ()
main = print $ validParens "()()()"

-- import qualified Data.Map.Strict as Map
--
-- type ParenMap = Map.Map Char Char
--
-- openers :: ParenMap
-- openers = Map.fromList [(')', '('), ('}', '{'), (']', '[')]
--
-- validParens :: String -> Bool
-- validParens str = go str []
--   where
--     go :: String -> String -> Bool
--     go [] stack = null stack
--     go (x:xs) stack =
--       case Map.lookup x openers of
--         Just open -> f not (null stack) && head stack == open
--                      then go xs (tail stack)
--                      else False
--         Nothing -> go xs (x:stack)
--
-- main :: IO ()
-- main = print $ validParens "()()()"
