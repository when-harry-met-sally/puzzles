module Codewars.Kata.Smash where

import Data.List
import Data.List (intercalate)

smash :: [String] -> String
smash = _smash 0

_smash :: [String] -> Num -> String
_smash 0 = _smash
