Sentence Smash
Write a function that takes an array of words and smashes them together into a sentence and returns the sentence. You can ignore any need to sanitize words or add punctuation, but you should add spaces between each word. Be careful, there shouldn't be a space at the beginning or the end of the sentence!

Example
['hello', 'world', 'this', 'is', 'great']  =>  'hello world this is great'

--- 

Doing in this in codewars/haskell.

First thought, is that in JS, this would just be a join, but if we want to do this in a functional way:

_smash arr n = 
  | 0 ->  (no space)
  | n -> '' arr n ++ ' ' ++ arr (n + 1)
  | len - 1 -> 'arr[n]'

```Haskell
module SentenceSmash where

-- Function to smash words together into a sentence
sentenceSmash :: [String] -> String
sentenceSmash = unwords

main :: IO ()
main = do
    let wordsList = ["hello", "world", "this", "is", "great"]
    putStrLn $ sentenceSmash wordsList  -- Output: "hello world this is great"
```

One approach using the unwords keywords, which essentially is join

```
module SentenceSmash where

-- Custom implementation of join with spaces using recursion
sentenceSmash :: [String] -> String
sentenceSmash [] = ""
sentenceSmash [x] = x
sentenceSmash (x:xs) = x ++ " " ++ sentenceSmash xs

main :: IO ()
main = do
    let wordsList = ["hello", "world", "this", "is", "great"]
    putStrLn $ sentenceSmash wordsList  -- Output: "hello world this is great"
```

This is what I was going for, but missed the mark.
```
module SentenceSmash where

-- Custom implementation of join with spaces using recursion
sentenceSmash :: [String] -> String
sentenceSmash [] = ""
sentenceSmash [x] = x
sentenceSmash (x:xs) = x ++ " " ++ sentenceSmash xs

main :: IO ()
main = do
    let wordsList = ["hello", "world", "this", "is", "great"]
    putStrLn $ sentenceSmash wordsList  -- Output: "hello world this is great"

```


```
module Codewars.Kata.Smash where

import Data.List

smash :: [String] -> String
smash s = intercalate " " s
```
