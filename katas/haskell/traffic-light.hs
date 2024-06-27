module TrafficLight where

light :: String -> String
light "green" = "yellow"
light "yellow" = "red"
light "red" = "green"

main :: IO ()
main = print $ light "green"
