{-# LANGUAGE TupleSections #-}
module DNA
    ( count
    , nucleotideCounts
    ) where

import Data.Monoid ( (<>) )
import Data.Map.Strict ( Map, (!), fromList, fromListWith )

type Nucleotide = Char

dna :: [Nucleotide]
dna = "ACGT"

count :: Nucleotide -> [Nucleotide] -> Int
count nuc strand 
  | nuc `elem` dna = nucleotideCounts strand ! nuc
  | nuc == 'U'     = 0
  | otherwise      = error $ "invalid nucleotide " ++ show nuc

nucleotideCounts :: [Nucleotide] -> Map Nucleotide Int
nucleotideCounts = (<> zeroCounts) . fromListWith (+) . map (,1)
 where zeroCounts = fromList $ map (,0) dna
