module PIN where

import Data.List (permutations)

getCandidates :: Int -> [Char]
getCandidates 1 = ['1', '2', '4']
getCandidates 2 = ['1', '2', '3', '5']
getCandidates 3 = ['2', '3', '6']
getCandidates 4 = ['1', '4', '5', '7']
getCandidates 5 = ['2', '4', '5', '6', '8']
getCandidates 6 = ['3', '5', '6', '9']
getCandidates 7 = ['4', '7', '8']
getCandidates 8 = ['5', '7', '8', '9', '0']
getCandidates 9 = ['6', '8', '9']
getCandidates 0 = ['8', '0']

toDigits :: Int -> [Int]
toDigits int
  | int <= 9  = [int]
  | otherwise = int `div` 10 : toDigits (int `mod` 10) 

getPINs :: String -> [String]
getPINs = map concat . permutations . map getCandidates . toDigits