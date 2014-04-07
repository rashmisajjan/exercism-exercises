module Raindrops ( convert ) where

convert :: Int -> String
convert n | null pl_ngs = show n
          | otherwise   = concat pl_ngs
  where pl_ngs = [sound | (factor, sound) <- rain, n `rem` factor == 0]
        rain = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
