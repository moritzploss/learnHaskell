module Spec.SecretFromTriplets (spec) where

import Katas (recoverSecret, findLeading, recoverSecret, removeChar, removeEmpty)
import Test.Hspec
import Test.QuickCheck

spec :: IO ()
spec = hspec $ do
    describe "recover secrets" $ do
      let triplets = ["tup"
                     ,"whi"
                     ,"tsu"
                     ,"ats"
                     ,"hap"
                     ,"tis"
                     ,"whs"
                     ]
      it "find leading char in string" $
        (foldl findLeading 't' triplets) == 'w'
      it "remove char from list of strings" $
        removeChar 'c' ["abc", "cde", "sdf"] == ["ab", "de", "sdf"]
      it "remove empty strings from list" $
        removeEmpty ["abc", "", "sdf"] == ["abc", "sdf"]
      it "recovers secret" $ recoverSecret triplets == "whatisup"
