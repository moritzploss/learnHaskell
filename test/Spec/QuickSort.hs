module Spec.QuickSort where

import Test.HUnit
import qualified Lib

testListAscending :: Test
testListAscending =
  TestCase $ assertEqual
    "Should sort ascending list ascending"
    [1, 2, 3]
    (Lib.quickSort [1, 2, 3])

testListDescending :: Test
testListDescending =
  TestCase $ assertEqual
    "Should sort descending list ascending"
    [1, 2, 3]
    (Lib.quickSort [3, 2, 1])

testListUnordered :: Test
testListUnordered =
  TestCase $ assertEqual
    "Should sort unordered list ascending"
    [1, 2, 3]
    (Lib.quickSort [2, 3, 1])

testList :: Test
testList = TestList [
     testListAscending
   , testListDescending
   , testListUnordered
   ]
