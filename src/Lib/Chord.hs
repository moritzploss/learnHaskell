module Lib.Chord
  ( Chord (..)
  , transpose
  , minor
  ) where

import qualified Lib.Note as Note
import qualified Data.IntSet as IntSet

type PitchClass = Int

data Chord = Chord
  { pitchClass :: PitchClass
  , notes :: IntSet.IntSet
  } deriving (Show, Eq)

transpose :: Int -> Chord -> Chord
transpose step chord = chord { pitchClass = transposed }
  where transposed = Note.transpose step $ pitchClass chord

add :: Int -> Chord -> Chord
add n chord = chord { notes = IntSet.insert n $ notes chord }

addRoot :: Chord -> Chord
addRoot = add 0

addMinorThird :: Chord -> Chord
addMinorThird = add 3

addPerfectFifth :: Chord -> Chord
addPerfectFifth = add 7

base :: PitchClass -> Chord
base pitchClass = Chord pitchClass IntSet.empty

minor :: PitchClass -> Chord
minor = addRoot . addMinorThird . addPerfectFifth . base
