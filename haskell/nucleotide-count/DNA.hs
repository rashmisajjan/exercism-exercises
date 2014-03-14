module DNA
    ( count
    , nucleotideCounts
    ) where


import Data.Map ( Map, adjust, fromList, lookup )
import Data.Maybe ( fromMaybe)
import Data.Word ( Word )
import Prelude hiding ( lookup )


type Nucleotide = Char
type DnaStrand  = [Nucleotide]
type Count      = Word


count :: Nucleotide -> DnaStrand -> Count
count nuc strand = fromMaybe (if nuc == 'U' then 0 else error msg)
                             (nuc `lookup` nucleotideCounts strand)
  where msg = "invalid nucleotide " ++ '\'' : nuc : "'"


nucleotideCounts :: DnaStrand -> Map Nucleotide Count
nucleotideCounts = foldr (adjust (+1)) (fromList $ zip "ACGT" [0, 0, 0, 0])
