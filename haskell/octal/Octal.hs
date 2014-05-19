module Octal (showOct, readOct) where

showOct :: (Integral a, Show a) => a -> String
showOct n | n < 8 = show n
          | otherwise = showOct q ++ show r
  where (q, r) = n `quotRem` 8

readOct :: Integral a => String -> a
readOct = foldl1 f . map octalDigitToIntegral
  where f acc n = acc `seq` 8*acc + n

octalDigitToIntegral :: Integral a => Char -> a
octalDigitToIntegral digit = case digit of
  '0' -> 0
  '1' -> 1
  '2' -> 2
  '3' -> 3
  '4' -> 4
  '5' -> 5
  '6' -> 6
  '7' -> 7
