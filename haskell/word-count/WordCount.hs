module WordCount ( wordCount ) where


import Data.Char ( isDigit, isLetter, isSpace, toLower )
import Data.Map  ( Map, fromListWith )
import Data.Word ( Word )


normalize :: Char -> Char
normalize c
  | isLetter c = toLower c
  | isDigit c  = c
  | isSpace c  = ' '
  | otherwise  = ' '


wordCount :: String -> Map String Word
wordCount = fromListWith (+) . flip zip (repeat 1) . words . map normalize
