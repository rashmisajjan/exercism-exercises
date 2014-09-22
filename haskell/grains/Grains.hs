module Grains where

import Data.Bits (shiftL)

square :: Int -> Integer
square = shiftL 1 . pred

total :: Integer
total = 1 `shiftL` 64 - 1
