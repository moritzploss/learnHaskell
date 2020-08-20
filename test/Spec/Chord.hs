module Spec.Chord (spec) where

import Control.Applicative
import Lib.Chord as Chord
  ( dominantSeventh,
    major,
    majorSeventh,
    minor,
    minorSeventh,
    new,
    transpose,
  )
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
  describe "Chords" $ do
    describe "transpose" $ do
      it "positive without wrapping" $
        transpose 2 (new 0 notes) `shouldBe` new 2 notes
      it "positive with wrapping" $
        transpose 14 (new 0 notes) `shouldBe` new 2 notes
      it "negative without wrapping" $
        transpose (-3) (new 5 notes) `shouldBe` new 2 notes
      it "negative with wrapping" $
        transpose (-15) (new 5 notes) `shouldBe` new 2 notes

    describe "chord composition" $ do
      it "compose minor chord" $
        minor 2 `shouldBe` new 2 [0, 3, 7]
      it "compose major chord" $
        major 9 `shouldBe` new 9 [0, 4, 7]
      it "compose dominant seventh chord" $
        dominantSeventh 3 `shouldBe` new 3 [0, 4, 7, 10]
      it "compose minor seventh chord" $
        minorSeventh 8 `shouldBe` new 8 [0, 3, 7, 10]
      it "compose major seventh chord" $
        majorSeventh 10 `shouldBe` new 10 [0, 4, 7, 11]
  where
    notes = [1, 2, 3]
