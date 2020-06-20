import Test.HUnit
import qualified Spec.Take

main :: IO Counts
main = runTestTT Spec.Take.testList