module Lib
    ( someFunc
    , Lib.take
    ) where

take :: Int -> [b] -> [b]
take _ []     = []
take 0 _      = []
take n (x:xs) = x:Lib.take (n - 1) xs

someFunc :: IO ()
someFunc = putStrLn "someFunc"