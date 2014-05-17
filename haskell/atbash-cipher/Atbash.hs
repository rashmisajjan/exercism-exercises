module Atbash (encode) where

import Data.Char (chr, isAlphaNum, isAscii, isLower, isUpper, ord)
import Data.List.Split (chunksOf)

-- | encode a string with the Atbash cipher
encode :: String -> String
encode = format . map encodeChar . filter isAsciiAlphaNum

format :: String -> String
format = unwords . chunksOf 5

encodeChar :: Char -> Char
encodeChar c | isUpper c = chr $ ord 'a' + ord 'Z' - ord c
             | isLower c = chr $ ord 'a' + ord 'z' - ord c
             | otherwise = c

isAsciiAlphaNum :: Char -> Bool
isAsciiAlphaNum c = isAlphaNum c && isAscii c
