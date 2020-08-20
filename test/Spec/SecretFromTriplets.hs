module Spec.SecretFromTriplets (spec) where

import Katas (findLeadingChar, recoverSecret, removeChar, removeEmpty)
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
  describe "Kata: SecretFromTriplets" $ do
    let triplets =
          [ "tup",
            "whi",
            "tsu",
            "ats",
            "hap",
            "tis",
            "whs"
          ]
    it "removes char from list of strings" $
      removeChar 'c' ["abc", "cde", "sdf"] == ["ab", "de", "sdf"]
    it "removes empty strings from list" $
      removeEmpty ["abc", "", "sdf"] == ["abc", "sdf"]
    it "finds leading char in list of strings" $
      findLeadingChar triplets == 'w'
    it "recovers secret" $
      recoverSecret triplets == "whatisup"
