module DNA
    ( count
    , nucleotideCounts
    ) where


import Data.Map ( Map, adjust, fromList, lookup )
import Data.Maybe ( fromMaybe)
import Data.Word ( Word )
import Prelude hiding ( lookup )


count :: Char -> String -> Word
count nucleotide strand =
    fromMaybe (if nucleotide == 'U' then 0 else error msg)
              (nucleotide `lookup` nucleotideCounts strand)
  where msg = "invalid nucleotide " ++ '\'' : nucleotide : "'"


nucleotideCounts :: String -> Map Char Word
nucleotideCounts = foldr (adjust (+1)) (fromList $ zip "ACGT" [0, 0, 0, 0])
