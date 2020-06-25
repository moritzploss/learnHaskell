module Lib.TypeClasses
  ( module Lib.TypeClasses
  ) where

import qualified Data.Map as Map
import Prelude hiding (Maybe, Just, Nothing)
import Lib.Tree

class Eq' a where
  (===) :: a -> a -> Bool
  (/==) :: a -> a -> Bool
  x === y = not (x /== y)
  x /== y = not (x === y)

data Drink = Water | Juice | Lemonade

instance Eq' Drink where
  Water === Water = True
  Juice === Juice = True
  Lemonade === Lemonade = True
  _ === _ = False

toString :: Drink -> String
toString Water = "Water"
toString Juice = "Juice"
toString Lemonade = "Lemonade"

data Maybe a = Nothing | Just a

instance (Eq m) => Eq (Maybe m) where
    Just x == Just y = x == y
    Nothing == Nothing = True
    _ == _ = False



data Vegetable = Carrot | Tomato | Olive deriving (Show, Eq, Read, Ord)

type Field = Map.Map Vegetable Int

data Garden = Garden { size :: Int
                     , location :: String
                     , crops :: Field
                     } deriving (Show, Eq)
          
plant :: Vegetable -> Int -> Field -> Field
plant vegetable count field =
  let updateCount _ newCount oldCount = newCount + oldCount
  in Map.insertWithKey updateCount vegetable count field
  
  
class Truthy a where
  truthy :: a -> Bool

instance Truthy Int where
  truthy 0 = False
  truthy _ = True
  
instance Truthy [a] where
  truthy [] = False
  truthy _ = True

instance Truthy Bool where
  truthy = id
  
instance Truthy (Maybe a) where
  truthy (Just _) = True
  truthy Nothing = False
  
class Fnctor f where
  fmp :: (a -> b) -> f a -> f b

instance Fnctor [] where
  fmp = map
  
instance Fnctor Maybe where
  fmp func (Just x) = Just $ func x
  fmp func Nothing  = Nothing

instance Fnctor (Either a) where
  fmp func (Left x)  = Left x
  fmp func (Right y) = Right $ func y