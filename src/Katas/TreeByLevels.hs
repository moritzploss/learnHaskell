-- You are given a binary tree:

-- data TreeNode a = TreeNode {
--   left  :: Maybe (TreeNode a),
--   right :: Maybe (TreeNode a),
--   value :: a
--   } deriving Show

-- Your task is to return the list with elements from tree sorted by levels,
-- which means the root element goes first, then root children (from left to
-- right) are second and third, and so on.

-- Return empty list if root is Nothing.

-- Example 1 - following tree:

--                  2
--             8        9
--           1  3     4   5

-- Should return following list:

-- [2,8,9,1,3,4,5]

-- Example 2 - following tree:

--                  1
--             8        4
--               3        5
--                          7

-- Should return following list:

-- [1,8,4,3,5,7]
--
module Katas.TreeByLevels (treeByLevels, TreeNode (..)) where

import Data.Maybe (isJust)

data TreeNode a = TreeNode
  { left :: Maybe (TreeNode a),
    right :: Maybe (TreeNode a),
    value :: a
  }
  deriving (Show)

treeByLevels :: Maybe (TreeNode a) -> [a]
treeByLevels Nothing = []
treeByLevels tree = breadthFirst [tree]
  where
    breadthFirst [] = []
    breadthFirst trees =
      map nodeValue trees
        ++ breadthFirst (concatMap justLeftRight trees)

    nodeValue (Just (TreeNode _ _ value)) = value
    justLeftRight (Just (TreeNode left right _)) = filter isJust [left, right]
