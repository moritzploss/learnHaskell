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

data Point = Point Float Float deriving (Show)

data Shape = 
  Circle Point Float |
  Rectangle Point Point
  deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs $ (x1 - x2) * (y1 - y2)

translate :: Shape -> Float -> Float -> Shape
translate (Circle (Point x y) r) dx dy = Circle (Point (x + dx) (y + dy)) r
translate (Rectangle (Point x1 y1) (Point x2 y2)) dx dy = Rectangle (Point (x1 + dx) (y1 + dy)) (Point (x2 + dx) (y2 + dy))

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
vplus (Vector x1 y1 z1) (Vector x2 y2 z2) = Vector (x1 + x2) (y1 + y2) (z1 + z2)

data Stem = Stem { length :: Float, angle :: Float, stack :: Float }

data Bar = Bar { reach :: Float, drop :: Float, width :: Float }

data Spacer = Spacer { height :: Float }

data HeadSet = HeadSet { stack :: Float }

data Cockpit = Cockpit {
  stem :: Stem,
  bar :: Bar,
  spacer :: Spacer,
  headSet :: HeadSet
  }
  
