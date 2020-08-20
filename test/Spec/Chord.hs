module Spec.Chord (spec) where

import Control.Applicative
import Lib.Chord as Chord
  ( create,
    dominantSeventh,
    major,
    majorSeventh,
    minor,
    minorSeventh,
    transpose,
  )
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
  describe "Chords" $ do
    describe "create chord" $ do
      it "with positive pitchclass wrapping" $
        create 15 [] `shouldBe` create 3 []
      it "with positive note wrapping" $
        create 3 [15, 16, 5] `shouldBe` create 3 [3, 4, 5]
      it "with negative pitchclass wrapping" $
        create (-5) [] `shouldBe` create 7 []
      it "with negative note wrapping" $
        create 3 [-5, -6, 5] `shouldBe` create 3 [7, 6, 5]
      it "ignore duplicate notes" $
        create 3 [1, 1, 2] `shouldBe` create 3 [1, 2]

    describe "transpose" $ do
      it "positive without wrapping" $
        transpose 2 (create 0 notes) `shouldBe` create 2 notes
      it "positive with wrapping" $
        transpose 14 (create 0 notes) `shouldBe` create 2 notes
      it "negative without wrapping" $
        transpose (-3) (create 5 notes) `shouldBe` create 2 notes
      it "negative with wrapping" $
        transpose (-15) (create 5 notes) `shouldBe` create 2 notes

    describe "chord composition" $ do
      it "compose minor chord" $
        minor 2 `shouldBe` create 2 [0, 3, 7]
      it "compose major chord" $
        major 9 `shouldBe` create 9 [0, 4, 7]
      it "compose dominant seventh chord" $
        dominantSeventh 3 `shouldBe` create 3 [0, 4, 7, 10]
      it "compose minor seventh chord" $
        minorSeventh 8 `shouldBe` create 8 [0, 3, 7, 10]
      it "compose major seventh chord" $
        majorSeventh 10 `shouldBe` create 10 [0, 4, 7, 11]
  where
    notes = [1, 2, 3]
