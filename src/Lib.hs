module Lib
  ( main
  , module Export
  ) where

import Lib.Tree as Export
import Lib.Util as Export
import Lib.TypeClasses as Export

main :: IO ()
main = putStrLn "Hello"