module Lib.Tree
  ( treeInsert
  , treeCreate
  , treeHas
  , treeFromList
  , Tree
  ) where

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

treeCreate :: a -> Tree a
treeCreate x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = treeCreate x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a  = Node a (treeInsert x left) right
  | x > a  = Node a left (treeInsert x right)

treeHas :: (Ord a) => a -> Tree a -> Bool
treeHas _ EmptyTree = False
treeHas x (Node a left right)
  | x == a = True
  | x < a  = treeHas x left
  | x > a  = treeHas x right

treeFromList :: (Ord a) => [a] -> Tree a
treeFromList = foldr treeInsert EmptyTree

instance Functor Tree where
  fmap func EmptyTree = EmptyTree
  fmap func (Node x left right) = Node (func x) (fmap func left) (fmap func right)