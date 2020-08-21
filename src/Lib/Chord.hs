module Lib.Chord
  ( create,
    transpose,
    major,
    minor,
    dominantSeventh,
    majorSeventh,
    minorSeventh,
  )
where

import qualified Data.IntSet as IntSet
import qualified Lib.PitchClass as PitchClass
import Lib.Types (Interval, Note, PitchClass)

data Chord = Chord
  { pitchClass :: PitchClass,
    notes :: IntSet.IntSet
  }
  deriving (Show, Eq)

create :: PitchClass -> [Note] -> Chord
create pitchClass notes =
  Chord
    { pitchClass = PitchClass.wrap pitchClass,
      notes = IntSet.fromList $ fmap PitchClass.wrap notes
    }

transpose :: Interval -> Chord -> Chord
transpose interval chord = chord {pitchClass = transposed}
  where
    transposed = PitchClass.transpose interval $ pitchClass chord

addNote :: Note -> Chord -> Chord
addNote note chord = chord {notes = IntSet.insert normNote $ notes chord}
  where
    normNote = PitchClass.wrap note

addRoot :: Chord -> Chord
addRoot = addNote 0

addMinorThird :: Chord -> Chord
addMinorThird = addNote 3

addMajorThird :: Chord -> Chord
addMajorThird = addNote 4

addPerfectFifth :: Chord -> Chord
addPerfectFifth = addNote 7

addMinorSeventh :: Chord -> Chord
addMinorSeventh = addNote 10

addMajorSeventh :: Chord -> Chord
addMajorSeventh = addNote 11

base :: PitchClass -> Chord
base pitchClass = create pitchClass []

minor :: PitchClass -> Chord
minor = addRoot . addMinorThird . addPerfectFifth . base

major :: PitchClass -> Chord
major = addRoot . addMajorThird . addPerfectFifth . base

dominantSeventh :: PitchClass -> Chord
dominantSeventh = addMinorSeventh . major

majorSeventh :: PitchClass -> Chord
majorSeventh = addMajorSeventh . major

minorSeventh :: PitchClass -> Chord
minorSeventh = addMinorSeventh . minor
