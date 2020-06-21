module Spec.Map where

import Test.HUnit
import qualified Lib

testMapListOfInts :: Test
testMapListOfInts =
  TestCase $ assertEqual
    "Should add 1 to each element of list"
    [2, 3, 4]
    (Lib.map (+ 1) [1, 2, 3])

testMapSquare :: Test
testMapSquare =
  TestCase $ assertEqual
    "Should square each element of list"
    [1, 4, 9]
    (Lib.map (\ x -> x * x) [1, 2, 3])

testMapListOfStrings :: Test
testMapListOfStrings =
  TestCase $ assertEqual
    "Should append 's' to each element of list"
    ["cats", "dogs", "birds"]
    (Lib.map (++ "s") ["cat", "dog", "bird"])

testList :: Test
testList = TestList [
     testMapListOfInts
   , testMapSquare
   , testMapListOfStrings
   ]
