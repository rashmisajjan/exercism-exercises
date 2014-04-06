module Matrix ( Matrix, flatten, rows, cols, row, column, shape
              , reshape, transpose, fromList, fromString ) where 

import Control.Arrow ( (&&&) )
import Data.List ( unfoldr )
import Data.Maybe ( listToMaybe )
import qualified Data.Vector as V
import Text.Printf ( printf )

data Matrix a = Matrix { flatten :: V.Vector a
                       , rows :: Int
                       , cols :: Int
                       } deriving (Eq, Show)

row :: Int -> Matrix a -> V.Vector a
row i (Matrix cells _ nCols) = V.slice (i*nCols) nCols cells

column :: Int -> Matrix a -> V.Vector a
column j (Matrix cells nRows nCols) =
  V.generate nRows (\i -> cells V.! (i * nCols + j))

size :: Matrix a -> Int
size = V.length . flatten

shape :: Matrix a -> (Int, Int)
shape = rows &&& cols

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (nRows, nCols) m
  | nRows * nCols == size m = m { rows=nRows, cols=nCols }
  | otherwise = error $ printf "Can't reshape %s Matrix into %s Matrix."
                               (show $ shape m) (show (nRows, nCols))

transpose :: Matrix a -> Matrix a
transpose m@(Matrix _ nRows nCols) = Matrix cells' nCols nRows
  where cells' = V.concat $ map (`column` m) [0 .. nCols-1]

fromList :: [[a]] -> Matrix a
fromList []         = Matrix V.empty 0 0
fromList xss@(xs:_) = Matrix (V.fromList $ concat xss) (length xss) (length xs)

fromString :: Read a => String -> Matrix a
fromString = fromList . map (unfoldr (listToMaybe . reads)) . lines
