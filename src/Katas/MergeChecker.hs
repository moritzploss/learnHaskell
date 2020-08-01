module Katas.MergeChecker (isMerge) where

matchLength :: Eq a => [a] -> [a] -> Int
matchLength [] _ = 0
matchLength _ [] = 0
matchLength (x:list) (y:otherList)
  | x == y    = 1 + matchLength list otherList
  | otherwise = 0

isMerge :: String -> String -> String -> Bool
isMerge x  y  [] = x == y
isMerge x  []  z = x == z
isMerge [] _   _ = False
isMerge (x:xs) partY@(y:ys) partZ@(z:zs)
  | (x /= y) && (x /= z) = False
  | (x == y) && (x /= z) = isMerge xs ys partZ
  | (x /= y) && (x == z) = isMerge xs partY zs
  | otherwise            =
    if matchLenY > matchLenZ
    then isMerge xs ys partZ
    else isMerge xs partY zs
    where matchLenY = matchLength xs ys
          matchLenZ = matchLength xs zs
