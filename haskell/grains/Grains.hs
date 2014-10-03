module Grains where

nFields :: Int
nFields = 64

square :: Integral a => a -> Integer
square n = 2 ^ (n - 1)

total :: Integer
total = 2 ^ nFields - 1
