module Phone
    ( 
      areaCode
    , number
    , prettyPrint
    ) where


import Data.Char ( isDigit )
import Data.List ( isPrefixOf )
import Text.Printf ( printf )


areaCode :: String -> String
areaCode = take 3 . number


number :: String -> String
number = validate . filter isDigit
  where validate phoneNumber = case length phoneNumber of
          10 -> phoneNumber
          11 -> if "1" `isPrefixOf` phoneNumber
                    then tail phoneNumber
                    else zeros
          _  -> zeros
          where zeros = replicate 10 '0'


prettyPrint :: String -> String
prettyPrint = format . number
  where format digits = let (part1, part2And3) = splitAt 3 digits
                            (part2, part3)     = splitAt 3 part2And3
                        in  printf "(%s) %s-%s" part1 part2 part3
