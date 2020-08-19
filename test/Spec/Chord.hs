module Spec.Chord (spec) where

import Lib.Chord (Chord (Chord), transpose)

import Control.Applicative
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
    describe "Chords" $ do
        describe "transpose" $ do
            it "positive without wrapping" $
                transpose 2 (Chord 0 [1, 2, 3]) `shouldBe` Chord 2 [1, 2, 3]
            it "positive with wrapping" $
                transpose 14 (Chord 0 [1, 2, 3]) `shouldBe` Chord 2 [1, 2, 3]
            it "negative without wrapping" $
                transpose (-3) (Chord 5 [1, 2, 3]) `shouldBe` Chord 2 [1, 2, 3]
            it "negative with wrapping" $
                transpose (-15) (Chord 5 [1, 2, 3]) `shouldBe` Chord 2 [1, 2, 3]
