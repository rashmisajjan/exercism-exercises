module Phone
    ( 
      areaCode
    , number
    , prettyPrint
    ) where


import Data.Char ( isDigit )
import Data.List.Split ( splitPlaces )
import Text.Printf ( printf )


areaCode :: String -> String
areaCode = take 3 . number


number :: String -> String
number = validate . filter isDigit
  where validate phoneNumber = case length phoneNumber of
          10 -> phoneNumber
          11 | head phoneNumber == '1' -> tail phoneNumber
          _ -> replicate 10 '0'


prettyPrint :: String -> String
prettyPrint = format . number
  where format digits = let [part1, part2, part3] = splitPlaces [3, 3, 4] digits
                        in  printf "(%s) %s-%s" part1 part2 part3
