import Data.List (sort)

isValidAnagram :: String -> String -> Bool
isValidAnagram x y = sort x == sort y

main :: IO ()
main = print $ isValidAnagram "test" "test"
