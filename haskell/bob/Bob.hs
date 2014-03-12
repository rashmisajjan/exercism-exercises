module Bob (responseFor) where


import Data.Char (isSpace, isLetter, isUpper)


responseFor :: String -> String
responseFor msg
  | all isSpace msg = "Fine. Be that way!"
  | isYelling msg   = "Woah, chill out!"
  | last msg == '?' = "Sure."
  | otherwise       = "Whatever."


isYelling :: String -> Bool
isYelling msg = not (null letters) && all isUpper letters
  where letters = filter isLetter msg
