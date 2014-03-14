module DNA
    ( count
    , nucleotideCounts
    ) where

import Data.Map ( Map, (!), adjust, fromList, member )
import Data.Word ( Word )

count :: Char -> String -> Word
count nucleotide strand
  | nucleotide `member` counts = counts ! nucleotide
  | nucleotide == 'U'          = 0
  | otherwise                  = error errorMsg
  where counts = nucleotideCounts strand
        errorMsg = "invalid nucleotide " ++ '\'' : nucleotide : "'"

nucleotideCounts :: String -> Map Char Word
nucleotideCounts = foldr (adjust (+1)) (fromList $ zip "ACGT" [0, 0, 0, 0])
