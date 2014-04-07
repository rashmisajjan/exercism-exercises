module Raindrops ( convert ) where

convert :: Int -> String
convert n = case pl_ngs of
    (_:_) -> concat pl_ngs
    []    -> show n
  where pl_ngs = [sound | (factor, sound) <- rain, n `rem` factor == 0]
        rain = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
