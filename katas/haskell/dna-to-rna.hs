module DnaToRna where

dnaToRna :: String -> String
dnaToRna =
  map
    ( \x -> case x of
        'T' -> 'U'
        _ -> x
    )

main :: IO ()
main = print $ dnaToRna "GCAT"
