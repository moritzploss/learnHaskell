import Test.HUnit
import Lib (take)

testSafeHeadForNonEmptyList :: Test
testSafeHeadForNonEmptyList =
    TestCase $ assertEqual "Should take first element from list"
                          [1] (Lib.take 1 [1])

main :: IO Counts
main = runTestTT $ TestList [
    testSafeHeadForNonEmptyList
  ]