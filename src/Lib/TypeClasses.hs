module Lib.TypeClasses
  ( module Lib.TypeClasses
  ) where

import qualified Data.Map as Map
import Prelude hiding (Maybe, Just, Nothing)

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
