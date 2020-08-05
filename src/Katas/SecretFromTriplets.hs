module Katas.SecretFromTriplets (recoverSecret, findLeading, removeChar, removeEmpty) where

import Data.List (head, delete, null, filter)

findLeading :: Char -> String -> Char
findLeading char string
  | char `elem` string = head string
  | otherwise          = char

removeChar :: Char -> [String] -> [String]
removeChar = map . delete

removeEmpty :: [String] -> [String]
removeEmpty = filter (not . null)

recoverSecret :: [String] -> String
recoverSecret []            = ""
recoverSecret strings@(x:_) = [leadingChar] ++ (recover strings)
  where recover = recoverSecret . removeEmpty . removeChar leadingChar
        leadingChar = foldFind (foldFind (head x) strings) strings
        foldFind = foldl findLeading
