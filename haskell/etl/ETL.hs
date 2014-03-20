module ETL ( transform ) where


import Data.Char ( toLower )
import Data.Map.Strict ( Map, fromList, toList )


transform :: Map Int [String] -> Map String Int
transform = fromList . concatMap invertAndLowerCase . toList
  where invertAndLowerCase (n, xs) = [(map toLower x, n) | x <- xs]
