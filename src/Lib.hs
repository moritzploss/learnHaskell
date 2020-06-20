module Lib
    ( someFunc
    , Lib.first
    , Lib.take
    ) where

first :: [a] -> Maybe a
first []    = Nothing
first (x:_) = Just x

take :: Int -> [b] -> [b]
take _ []     = []
take 0 _      = []
take n (x:xs) = x:Lib.take (n - 1) xs

someFunc :: IO ()
someFunc = putStrLn "someFunc"