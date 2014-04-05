{-# LANGUAGE TupleSections #-}
module DNA
    ( count
    , nucleotideCounts
    ) where

import Data.Map.Strict ( Map, (!), fromListWith )

type Nucleotide = Char

dna :: [Nucleotide]
dna = "ACGT"

count :: Nucleotide -> [Nucleotide] -> Int
count nuc strand 
  | nuc `elem` dna = nucleotideCounts strand ! nuc
  | nuc == 'U'     = 0
  | otherwise      = error $ "invalid nucleotide " ++ show nuc

nucleotideCounts :: [Nucleotide] -> Map Nucleotide Int
nucleotideCounts = fromListWith (+) . (++ zeros) . map (,1)
 where zeros = map (,0) dna
