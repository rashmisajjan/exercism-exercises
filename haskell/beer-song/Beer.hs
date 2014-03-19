module Beer ( sing, verse ) where


import Data.Char ( toUpper )


sing :: Int -> Int -> String
sing start end = unlines $ map verse [start, start-1..end]


verse :: Int -> String
verse n = line1 ++ line2
  where line1 = upperCaseHead bottlesNow ++ wall ++ ", " ++ bottlesNow ++ ".\n"
        line2 = takeOrGo n ++ bottlesThen ++ wall ++ ".\n"
        bottlesNow = bottles n
        bottlesThen = bottles $ (n-1) `mod` 100
        wall = " on the wall"


upperCaseHead :: String -> String
upperCaseHead (c:cs) = toUpper c : cs
upperCaseHead []     = undefined


bottles :: Int -> String
bottles 0 = "no more bottles of beer"
bottles 1 = "1 bottle of beer"
bottles n = show n ++ " bottles of beer"


takeOrGo :: Int -> String
takeOrGo n
  | n == 0    = "Go to the store and buy some more, "
  | n ==  1   = "Take it " ++ down
  | otherwise = "Take one " ++ down
  where down = "down and pass it around, "
