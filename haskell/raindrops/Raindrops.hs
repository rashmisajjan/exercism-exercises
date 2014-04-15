module Raindrops ( convert ) where

convert :: Int -> String
convert n | null sounds = show n
          | otherwise   = sounds
  where sounds = [c | (x, cs) <- [(3, "Pling"), (5, "Plang"), (7, "Plong")]
                    , n `rem` x == 0
                    , c <- cs]
