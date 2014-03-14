module Anagram (anagramsFor) where


import Data.Char (toLower)
import Data.List (sort)


-- | 'anagramsFor', applied to a word and a list of candidate strings,
-- returns the list of those candidates that are anagrams of the word.
anagramsFor :: String -> [String] -> [String]
anagramsFor x ys = filter (isAnagramOfX . lowerCase) ys
  where isAnagramOfX yLower = yLower /= xLower && sort yLower == xLowerSorted
        xLower              = lowerCase x
        xLowerSorted        = sort xLower


lowerCase :: String -> String
lowerCase = map toLower
