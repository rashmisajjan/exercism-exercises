module Atbash (encode) where

import Data.Char (chr, isAlphaNum, isAscii, isLetter, ord, toLower)
import Data.List.Split (chunksOf)

-- | encode a string with the Atbash cipher
encode :: String -> String
encode = format . map encodeChar . filter isAsciiAlphaNum

format :: String -> String
format = unwords . chunksOf 5

encodeChar :: Char -> Char
encodeChar c | isLetter c = chr $ ord 'a' + ord 'z' - ord (toLower c)
             | otherwise  = c

isAsciiAlphaNum :: Char -> Bool
isAsciiAlphaNum c = isAlphaNum c && isAscii c
