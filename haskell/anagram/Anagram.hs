module Anagram ( anagramsFor ) where


import Data.Char (toLower)
import Data.List (sort)


-- | 'anagramsFor', applied to a word and a list of candidate strings,
-- returns the list of those candidates that are anagrams of the word.
anagramsFor :: String -> [String] -> [String]
anagramsFor x = filter isAnagramOfX
  where isAnagramOfX y = let yLower = map toLower y
                             yChars = sort yLower
                         in  (yChars == xChars) && (yLower /= xLower)
        xLower         = map toLower x
        xChars         = sort xLower
