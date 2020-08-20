module Spec.Take where

import qualified Lib
import Test.HUnit

testTakeOne :: Test
testTakeOne =
  TestCase $
    assertEqual
      "Should take first element from list"
      (take 1 [1, 2, 3])
      (Lib.take 1 [1, 2, 3])

testTakeThree :: Test
testTakeThree =
  TestCase $
    assertEqual
      "Should take 3 first elements from list"
      (take 3 [1, 2, 3, 4, 5])
      (Lib.take 3 [1, 2, 3, 4, 5])

testTakeZero :: Test
testTakeZero =
  TestCase $
    assertEqual
      "Should return empty list"
      []
      (Lib.take 0 [1, 2, 3])

testTakeExcess :: Test
testTakeExcess =
  TestCase $
    assertEqual
      "Should return list if n greater list length"
      (take 5 [1, 2, 3])
      (Lib.take 5 [1, 2, 3])

testList :: Test
testList =
  TestList
    [ testTakeOne,
      testTakeThree,
      testTakeZero,
      testTakeExcess
    ]
