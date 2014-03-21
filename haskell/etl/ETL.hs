module ETL ( transform ) where

import Data.Char ( toLower )
import Data.Map.Strict ( Map, fromList, toList )

type LowerCaseString = String

transform :: Map Int [String] -> Map LowerCaseString Int
transform = fromList . concatMap go . toList
  where go (num, strings) = [(map toLower s, num) | s <- strings]
