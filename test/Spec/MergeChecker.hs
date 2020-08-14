module Spec.MergeChecker (spec) where

import Katas (isMerge)
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
    describe "Kata: MergeChecker" $ do
      it "works on empty strings" $ isMerge "" "" ""
      it "returns True if one part is emtpy and the other is equal to s" $
        property $ \xs ->
          isMerge xs xs "" .&&. isMerge xs "" xs
      it "returns False if one part is empty and the other isn't equal to s" $
        property $ \xs ys -> xs /= ys ==>
          not (isMerge xs ys "") .&&. not (isMerge xs "" ys)
      it "works if s is simply the concatenation of both parts" $
        property $ \xs ys ->
          isMerge (xs ++ ys) xs ys .&&. isMerge (ys ++ xs) xs ys

      it "works on bananarama ding dong" $
        isMerge "Bananas from Bahamas" "Bahas" "Bananas from am"

      it "works if s is an interleaved string" $
        let interleave []     ys     = ys
            interleave xs     []     = xs
            interleave (x:xs) (y:ys) = x : y : interleave xs ys
        in property $ \xs ys ->
          isMerge (interleave xs ys) xs ys .&&. isMerge (interleave ys xs) xs ys
