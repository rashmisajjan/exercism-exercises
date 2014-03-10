module Anagram ( anagramsFor ) where


import Data.Char (toLower)
import Data.List (sort)


-- | 'anagramsFor', applied to a word and a list of candidate strings,
-- returns the list of those candidates that are anagrams of the word.
anagramsFor :: String -> [String] -> [String]
anagramsFor x = filter isAnagramOfX
  where isAnagramOfX y
          | yChars /= xChars = False  -- must have the same characters
          | yLower == xLower = False  -- can't just be differently cased
          | otherwise        = True
          where yChars = sort yLower
                yLower = lowerCase y
        xLower = lowerCase x
        xChars = sort xLower


lowerCase :: String -> String
lowerCase = map toLower
