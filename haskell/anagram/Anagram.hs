module Anagram ( anagramsFor ) where

import Data.Char (toLower)
import Data.List (sort)

------------------------------------------------------------------------------
-- | 'anagramsFor', applied to a word and a list of candidate strings,
-- returns the list of those candidates that are anagrams of the word.
anagramsFor :: String -> [String] -> [String]
anagramsFor x = filter isAnagramOfX
  where isAnagramOfX y = (chars y == xChars) && (y /= x)
        xChars         = chars x


------------------------------------------------------------------------------
-- | Sorts and normalizes the characters of a string. Two strings can only be
-- anagrams if 'chars' returns the same for each.
chars :: String -> String
chars = sort . map toLower
