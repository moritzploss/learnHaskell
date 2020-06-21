module Lib
  ( someFunc
  , Lib.first
  , Lib.max
  , Lib.quickSort
  , Lib.take
  ) where

first :: [a] -> Maybe a
first []    = Nothing
first (x:_) = Just x

max :: (Ord a) => [a] -> a
max [x]       = x
max (x:xs)
  | x > maxXs = x
  | otherwise = maxXs
  where maxXs = Lib.max xs

quickSort :: (Ord a) => [a] -> [a]
quickSort []     = []
quickSort (x:xs) =
  let smaller = quickSort [a | a <- xs, a <= x]
      greater = quickSort [a | a <- xs, a > x]
  in smaller ++ [x] ++ greater

take :: Int -> [b] -> [b]
take _ []     = []
take 0 _      = []
take n (x:xs) = x:Lib.take (n - 1) xs

someFunc :: IO ()
someFunc = putStrLn "someFunc"