{-# LANGUAGE TupleSections #-}

module WordCount ( wordCount ) where


import Data.Char ( isAlphaNum, toLower )
import Data.Map.Strict  ( Map, fromListWith )


wordCount :: String -> Map String Int
wordCount = counter . words . map normalize


counter :: Ord a => [a] -> Map a Int
counter = fromListWith (+) . map (,1)


normalize :: Char -> Char
normalize c
  | isAlphaNum c = toLower c
  | otherwise    = ' '
