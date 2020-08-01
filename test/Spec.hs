import Test.HUnit
import qualified Spec.Filter
import qualified Spec.First
import qualified Spec.Map
import qualified Spec.Max
import qualified Spec.QuickSort
import qualified Spec.Reduce
import qualified Spec.ReduceWhile
import qualified Spec.Take
import qualified Spec.Tree

import qualified Spec.MergeChecker

main :: IO Counts
main = do
  Spec.MergeChecker.spec
  runTestTT Spec.Filter.testList
  runTestTT Spec.First.testList
  runTestTT Spec.Map.testList
  runTestTT Spec.Max.testList
  runTestTT Spec.QuickSort.testList
  runTestTT Spec.Reduce.testList
  runTestTT Spec.ReduceWhile.testList
  runTestTT Spec.Take.testList
  runTestTT Spec.Tree.testList

