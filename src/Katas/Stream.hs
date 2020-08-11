-- Introduction

-- Infinite sequences are common, natural numbers for example are defined such
-- that they always have a successor. In Haskell, most of the time lists are
-- used to model infinite sequences, but why should we check for the empty
-- case, if it will never occur?

-- Streams offer an elegant alternative to model infinite data. A stream has a
-- head element and an infinite tail, in lazy languages this is no problem,
-- since the tail gets only evaluated when needed. But in languages with
-- strict evaluation we need a lambda function to delay evaluation.

-- Note: We will define Stream with the equivalent infix operator constructor.
-- data Stream a = a :> Stream a

module Katas.Stream where

import Control.Arrow
import Control.Applicative

infixr 5 :>
data Stream a = a :> (Stream a) deriving (Show, Read, Eq, Ord)

-- Defined in Stream.Internal:
--     data Stream a = a :> Stream a
--     infixr :>

-- | Get the first element of a stream.
headS :: Stream a -> a
headS (x :> _) = x

-- | Drop the first element of a stream.
tailS :: Stream a -> Stream a
tailS (_ :> x) = x


-- {{{ Stream constructors

-- | Construct a stream by repeating a value.
repeatS :: a -> Stream a
repeatS x = x :> repeatS x

-- | Construct a stream by repeatedly applying a function.
iterateS :: (a -> a) -> a -> Stream a
iterateS f x = x :> iterateS f (f x)

-- | Construct a stream by repeating a list forever.
cycleS :: [a] -> Stream a
cycleS (x:xs) = x :> (cycleS $ xs ++ [x])

-- | Construct a stream by counting numbers starting from a given one.
fromS :: Num a => a -> Stream a
fromS x = fromStepS x 1

-- | Same as 'fromS', but count with a given step width.
fromStepS :: Num a => a -> a -> Stream a
fromStepS x s = x :> fromStepS (x + s) s

-- }}}


-- | Fold a stream from the left.
foldrS :: (a -> b -> b) -> Stream a -> b
foldrS f (x :> xs) = f x $ foldrS f xs

-- | Filter a stream with a predicate.
filterS :: (a -> Bool) -> Stream a -> Stream a
filterS p (x :> xs)
  | p x       = x :> tail
  | otherwise = tail
  where tail = filterS p xs

-- | Take a given amount of elements from a stream.
takeS :: Int -> Stream a -> [a]
takeS i (s :> ss)
  | i <= 0    = []
  | otherwise = [s] ++ takeS (i - 1) ss

-- | Drop a given amount of elements from a stream.
dropS :: Int -> Stream a -> Stream a
dropS i stream@(x :> xs)
  | i <= 0    = stream
  | otherwise = dropS (i - 1) xs

-- | Do take and drop simultaneous.
splitAtS :: Int -> Stream a -> ([a], Stream a)
splitAtS i s = (takeS i s, dropS i s)

-- | Combine two streams with a function.
zipWithS :: (a -> b -> c) -> Stream a -> Stream b -> Stream c
zipWithS f (x :> xs) (y :> ys) = f x y :> zipWithS f xs ys

zipS :: Stream a -> Stream b -> Stream (a, b)
zipS = zipWithS (,)

instance Functor Stream where
    -- fmap :: (a -> b) -> Stream a -> Stream b
    fmap f (x :> xs) = f x :> fmap f xs

instance Applicative Stream where
    -- pure :: a -> Stream a
    pure x = repeatS x

    -- (<*>) :: Stream (a -> b) -> Stream a -> Stream b
    (<*>) (f :> fs) (x :> xs) = f x :> (<*>) fs xs

-- | The stream of fibonacci numbers.
fibS :: Stream Integer
fibS = 0 :> 1 :> zipWithS (+) fibS (dropS 1 fibS)

isPrime :: Integer -> Bool
isPrime n = [x | x <- [1..n], mod n x == 0] == [1, n]

-- | The stream of prime numbers.
primeS :: Stream Integer
primeS = filterS isPrime (fromS 0)