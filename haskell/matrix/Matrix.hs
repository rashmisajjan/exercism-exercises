module Matrix 
    (
      Matrix
    , row
    , column
    , rows
    , cols
    , shape
    , transpose
    , reshape
    , flatten
    , fromString
    , fromList
    ) where

import Control.Arrow ( (&&&) )
import qualified Data.Vector as V

type Matrix a = V.Vector (V.Vector a)

row :: Int -> Matrix a -> V.Vector a
row = flip (V.!)

column :: Int -> Matrix a -> V.Vector a
column i = row i . transpose

rows :: Matrix a -> Int
rows = V.length

cols :: Matrix a -> Int
cols = rows . transpose

shape :: Matrix a -> (Int, Int)
shape = rows &&& cols

transpose :: Matrix a -> Matrix a
transpose m
  | V.null m          = V.empty
  | V.null (V.head m) = V.empty
  | otherwise         = V.map V.head m `V.cons` transpose (V.map V.tail m)

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (r, c) m = go r $ flatten m
  where go 0  _ = V.empty
        go r' v = let (h, t) = V.splitAt c v
                  in  h `V.cons` go (r'-1) t

flatten :: Matrix a -> V.Vector a
flatten = V.concatMap id

fromList :: [[a]] -> Matrix a
fromList = V.fromList . map V.fromList

fromString :: Read a => String -> Matrix a
fromString = fromList . map readAll . lines
  where readAll s = case reads s of
          [] -> []
          (x, rest) : _ -> x : readAll rest
