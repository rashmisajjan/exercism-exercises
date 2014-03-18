module DNA
    ( count
    , nucleotideCounts
    ) where


import Data.List ( foldl' )
import Data.Map.Strict ( Map, adjust, fromDistinctAscList, lookup )
import Data.Maybe ( fromMaybe )
import Prelude hiding ( lookup )


type Nucleotide = Char


count :: Nucleotide -> [Nucleotide] -> Int
count nuc = fromMaybe notFound . lookup nuc . nucleotideCounts
  where notFound = case nuc of
          'U' -> 0
          _   -> error $ "invalid nucleotide " ++ show nuc


nucleotideCounts :: [Nucleotide] -> Map Nucleotide Int
nucleotideCounts = foldl' increment zeroCounts
  where increment counts nuc = adjust (+1) nuc counts
        zeroCounts           = fromDistinctAscList [(c, 0) | c <- "ACGT"]
