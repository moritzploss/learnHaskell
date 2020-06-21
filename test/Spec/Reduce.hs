module Spec.Reduce where

import Test.HUnit
import qualified Lib

testJoinListOfStrings :: Test
testJoinListOfStrings =
  TestCase $ assertEqual
    "Join list of strings"
    "hello world"
    (Lib.reduce (++) "" ["hel", "lo ", "wo", "rld"])

testCalculateSumOfSquares :: Test
testCalculateSumOfSquares =
  TestCase $ assertEqual
    "Calculate sum of squares"
    (1 + 4 + 9 + 16 + 25)
    (Lib.reduce (\ acc elm -> elm ^ 2 + acc) 0 [1, 2, 3, 4, 5])

testList :: Test
testList = TestList [
     testJoinListOfStrings
   , testCalculateSumOfSquares
   ]
