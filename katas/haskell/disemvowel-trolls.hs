module Disemvowel where

disemvowel :: String -> String
disemvowel = filter (\n -> notElem n "aeiouAEIOU")

main :: IO ()
main = print $ disemvowel "You suck dude"
