module Allergies where

import Data.Bits (testBit)

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Enum, Eq, Show)

type Score = Int

allergies :: Score -> [Allergen]
allergies score = filter (`isAllergicTo` score) [Eggs ..]

isAllergicTo :: Allergen -> Score -> Bool
isAllergicTo allergen score = score `testBit` fromEnum allergen
