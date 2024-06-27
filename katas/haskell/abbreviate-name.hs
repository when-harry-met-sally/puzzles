module Initials where

import Data.Char (toUpper)

getInitials :: String -> String
getInitials x = [(toUpper $ w !! 0 !! 0), '.', (toUpper $ w !! 1 !! 0)]
  where
    w = words x

main :: IO ()
main = print $ getInitials "Miles Moran"
