import Test.HUnit
import qualified Spec.First
import qualified Spec.Map
import qualified Spec.Max
import qualified Spec.QuickSort
import qualified Spec.Reduce
import qualified Spec.Take

main :: IO Counts
main = do
  runTestTT Spec.First.testList
  runTestTT Spec.Map.testList
  runTestTT Spec.Max.testList
  runTestTT Spec.QuickSort.testList
  runTestTT Spec.Reduce.testList
  runTestTT Spec.Take.testList
