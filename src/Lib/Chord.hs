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
import qualified Lib.Note as Note

type PitchClass = Int

type Interval = Int

type Note = Int

data Chord = Chord
  { pitchClass :: PitchClass,
    notes :: IntSet.IntSet
  }
  deriving (Show, Eq)

create :: PitchClass -> [Int] -> Chord
create pitchClass notes = Chord normPitchClass normNotes
  where
    normPitchClass = normalize pitchClass
    normNotes = IntSet.fromList $ fmap normalize notes
    normalize note = (note `mod` 12 + 12) `mod` 12

transpose :: Interval -> Chord -> Chord
transpose interval chord = chord {pitchClass = transposed}
  where
    transposed = Note.transpose interval $ pitchClass chord

addNote :: Note -> Chord -> Chord
addNote note chord = chord {notes = IntSet.insert note $ notes chord}

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
