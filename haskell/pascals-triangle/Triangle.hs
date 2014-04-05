module Triangle ( row, triangle ) where

triangle :: Integral a => [[a]]
triangle = iterate go [1]
  where go xs = 1 : zipWith (+) xs (tail xs) ++ [1]

row :: Integral a => Int -> [a]
row = (triangle !!) . subtract 1
