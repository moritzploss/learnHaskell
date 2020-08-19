module Lib.Chord
  ( Chord (..)
  , transpose
  ) where

import qualified Lib.Note as Note

data Chord = Chord
  { pitchClass :: Int
  , notes :: [Int] } deriving (Show, Eq)

transpose :: Int -> Chord -> Chord
transpose step chord = chord { pitchClass = transposed }
  where transposed = Note.transpose step $ pitchClass chord
