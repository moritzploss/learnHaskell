module Lib.Note
  ( transpose,
  )
where

transpose :: Int -> Int -> Int
transpose step note = (effectiveStep + note) `mod` 12
  where
    effectiveStep = step `mod` 12 + 12
