lengthOfLastWord :: String -> Int
lengthOfLastWord x = length . last $ words x

main :: IO ()
main = print $ lengthOfLastWord "This is a long word, don't you knowsssss"
