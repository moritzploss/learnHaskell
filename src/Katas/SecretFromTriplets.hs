module Katas.SecretFromTriplets (findLeadingChar, recoverSecret, removeChar, removeEmpty) where

import Data.List ((\\), delete, nub, transpose)

removeChar :: Char -> [String] -> [String]
removeChar = map . delete

removeEmpty :: [String] -> [String]
removeEmpty = filter $ not . null

findLeadingChar :: [String] -> Char
findLeadingChar strings = head $ nub firstChars \\ concat otherChars
  where (firstChars:otherChars) = transpose strings

recoverSecret :: [String] -> String
recoverSecret []      = ""
recoverSecret strings = [leadingChar] ++ recoverSecret otherChars
  where leadingChar = findLeadingChar strings
        otherChars  = removeEmpty $ removeChar leadingChar strings
