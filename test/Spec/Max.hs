module Spec.Max where

import Test.HUnit
import qualified Lib

testListAscending :: Test
testListAscending =
  TestCase $ assertEqual
    "Should return max element in ascending list"
    3
    (Lib.max [1, 2, 3])

testListDescending :: Test
testListDescending =
  TestCase $ assertEqual
    "Should return max element in descending list"
    3
    (Lib.max [3, 2, 1])

testListUnordered :: Test
testListUnordered =
  TestCase $ assertEqual
    "Should return max element in unordered list"
    3
    (Lib.max [2, 3, 1])

testList :: Test
testList = TestList [
     testListAscending
   , testListDescending
   , testListUnordered
   ]
