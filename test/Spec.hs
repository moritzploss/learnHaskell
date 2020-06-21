import Test.HUnit
import qualified Spec.First
import qualified Spec.Max
import qualified Spec.QuickSort
import qualified Spec.Take

main :: IO Counts
main = do
  runTestTT Spec.First.testList
  runTestTT Spec.Max.testList
  runTestTT Spec.QuickSort.testList
  runTestTT Spec.Take.testList
