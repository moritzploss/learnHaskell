module Spec.First where

import Test.HUnit
import qualified Lib
import Data.Maybe (fromMaybe)

testFirst :: Test
testFirst =
  TestCase $ assertEqual
    "Should take first element from list"
    1
    (fromMaybe 0 (Lib.first [1, 2, 3]))
    
testFirstSingleElement :: Test
testFirstSingleElement =
  TestCase $ assertEqual
    "Should take first element from single-element list"
    1
    (fromMaybe 0 (Lib.first [1]))
    
testFirstZeroElement :: Test
testFirstZeroElement =
  TestCase $ assertEqual
    "Should return Nothing for zero-element list"
    0
    (fromMaybe 0 (Lib.first []))

testList :: Test
testList = TestList [
     testFirst
   , testFirstSingleElement
   , testFirstZeroElement
   ]
