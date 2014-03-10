module Anagram (anagramsFor) where


import Data.Char (toLower)
import Data.List (sort)


-- | 'anagramsFor', applied to a word and a list of candidate strings,
-- returns the list of those candidates that are anagrams of the word.
anagramsFor :: String -> [String] -> [String]
anagramsFor x = filter isAnagramOfX
  where
    -- 'isAnagramOfX' checks that
    -- 1) y isn't simply a differently cased version of x
    -- 2) y consists of the same characters as x, irregardless of the
    -- casing.
    isAnagramOfX y = yLower /= xLower && yChars == xChars
      where yLower = lowerCase y
            yChars = sort yLower
    xLower = lowerCase x
    xChars = sort xLower


lowerCase :: String -> String
lowerCase = map toLower
