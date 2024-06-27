module Solution where

solution :: String -> String -> String
solution [] arr = arr
solution (x : xs) arr = solution xs (x : arr)

main :: IO ()
main = print $ solution "green" ""
