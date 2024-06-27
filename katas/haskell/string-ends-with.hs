module Solution where

solution :: String -> String -> Bool
solution [] _ = False -- Correct handling of empty first string
solution _ [] = True -- Any string is a suffix of itself
solution xs ys
  | length ys > length xs = False -- A longer string cannot be a suffix
  | otherwise = drop (length xs - length ys) xs == ys -- Check if the end of `xs` matches `ys`

main :: IO ()
main = print $ solution "green" "en"
