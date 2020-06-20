import Test.HUnit
import qualified Spec.Take
import qualified Spec.First

main :: IO Counts
main = do
  runTestTT Spec.Take.testList
  runTestTT Spec.First.testList