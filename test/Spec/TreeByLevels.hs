module Spec.TreeByLevels where

import Katas (TreeNode (TreeNode), treeByLevels)
import Test.Hspec
import Test.QuickCheck

buildTree :: [a] -> Maybe (TreeNode a)
buildTree l = fst $ walk $ split 1 l
  where
    split _ [] = []
    split n l = h : split (2 * n) t
      where
        (h, t) = splitAt n l
    walk [] = (Nothing, [])
    walk ls@([] : _) = (Nothing, ls)
    walk ((h : t) : ls) = (Just $ TreeNode l r h, t : ls'')
      where
        (l, ls') = walk ls
        (r, ls'') = walk ls'

testBuildTree :: (Show a, Eq a) => [a] -> Expectation
testBuildTree x = treeByLevels (buildTree x) `shouldBe` x

spec :: Spec
spec = do
  describe "Kata: TreeByLevels" $ do
    it "returns [] given Nothing" $
      treeByLevels Nothing `shouldBe` ([] :: [()])
    it "handles tree with one element" $
      treeByLevels (Just $ TreeNode Nothing Nothing 1) `shouldBe` [1]
    it "sorts example tree 1" $
      testBuildTree [2, 8, 9, 1, 3, 4, 5]
