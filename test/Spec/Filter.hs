module Spec.Filter where

import Test.HUnit
import qualified Lib

testFilterGreater10 :: Test
testFilterGreater10 =
  TestCase $ assertEqual
    "Should filter out all numbers greater 10"
    [11, 12, 13, 14]
    (Lib.filter (> 10) [11, 1, 12, 2, 3, 13, 4, 14, 5])

testList :: Test
testList = TestList [
     testFilterGreater10
   ]
