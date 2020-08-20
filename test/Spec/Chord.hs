module Spec.Chord (spec) where

import Lib.Chord (Chord (Chord), transpose, minor)
import Data.IntSet (fromList)

import Control.Applicative
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
    describe "Chords" $ do
        describe "transpose" $ do
            it "positive without wrapping" $
                transpose 2 (Chord 0 notes) `shouldBe` Chord 2 notes
            it "positive with wrapping" $
                transpose 14 (Chord 0 notes) `shouldBe` Chord 2 notes
            it "negative without wrapping" $
                transpose (-3) (Chord 5 notes) `shouldBe` Chord 2 notes
            it "negative with wrapping" $
                transpose (-15) (Chord 5 notes) `shouldBe` Chord 2 notes

        describe "chord composition" $ do
            it "compose minor chord" $
                minor 2 `shouldBe` Chord 2 minorNotes

    where
        notes      = fromList [1, 2, 3]
        minorNotes = fromList [0, 3, 7]

