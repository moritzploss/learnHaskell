import Test.HUnit
import Lib (take)

testTake :: Test
testTake =
    TestCase $ assertEqual "Should take first element from list"
                          [1] (Lib.take 1 [1])

main :: IO Counts
main = runTestTT $ TestList [
    testTake
  ]