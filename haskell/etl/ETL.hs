module ETL ( transform ) where

import Data.Char ( toLower )
import Data.Map.Strict ( Map, fromList, toList )

type LowerCaseString = String

transform :: Map Int [String] -> Map LowerCaseString Int
transform = fromList . go . toList
  where go xs = [(map toLower s, n) | (n, strings) <- xs, s <- strings]
