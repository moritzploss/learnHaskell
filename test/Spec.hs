import qualified Spec.Chord
import qualified Spec.Filter
import qualified Spec.First
import qualified Spec.Map
import qualified Spec.Max
import qualified Spec.MergeChecker
import qualified Spec.QuickSort
import qualified Spec.Reduce
import qualified Spec.ReduceWhile
import qualified Spec.SecretFromTriplets
import qualified Spec.Stream
import qualified Spec.Take
import qualified Spec.TreeByLevels
import Test.HUnit (Counts, runTestTT)
import Test.Hspec (hspec)

main :: IO Counts
main = do
  hspec Spec.MergeChecker.spec
  hspec Spec.SecretFromTriplets.spec
  hspec Spec.Stream.spec
  hspec Spec.TreeByLevels.spec
  hspec Spec.Chord.spec
  runTestTT Spec.Filter.testList
  runTestTT Spec.First.testList
  runTestTT Spec.Map.testList
  runTestTT Spec.Max.testList
  runTestTT Spec.QuickSort.testList
  runTestTT Spec.Reduce.testList
  runTestTT Spec.ReduceWhile.testList
  runTestTT Spec.Take.testList
