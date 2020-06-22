module Spec.ReduceWhile where

import Test.HUnit
import qualified Lib

testReduceWhileSumSmaller9 :: Test
testReduceWhileSumSmaller9 =
  TestCase $ assertEqual
    "Sum elements as long as sum is smaller than 9"
    13
    (Lib.reduceWhile (\ acc elm -> acc < 9 ) (+) 0 [1, 3, 4, 5, 7])

testList :: Test
testList = TestList [
     testReduceWhileSumSmaller9
   ]
