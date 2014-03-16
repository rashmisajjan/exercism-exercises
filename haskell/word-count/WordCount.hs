module WordCount ( wordCount ) where


import Data.Char ( isDigit, isLetter, toLower )
import Data.Map  ( Map, fromListWith )
import Data.Word ( Word )


wordCount :: String -> Map String Word
wordCount = counter . words . map normalize


counter :: Ord a => [a] -> Map a Word
counter = fromListWith (+) . flip zip (repeat 1)


normalize :: Char -> Char
normalize c
  | isLetter c = toLower c
  | isDigit c  = c
  | otherwise  = ' '
