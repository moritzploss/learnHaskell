module Lib
    ( someFunc
    , Lib.take
    ) where

take :: a -> [b] -> [b]
take n [x] = [x]

someFunc :: IO ()
someFunc = putStrLn "someFunc"