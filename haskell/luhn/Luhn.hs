module Luhn (checkDigit, addends, checksum, isValid, create) where

checkDigit :: Integer -> Integer
checkDigit = (`rem` 10)

addends :: Integer -> [Integer]
addends = reverse . addends' . revDigits
  where addends' = zipWith ($) (cycle [id, double'])
        double' x | x > 4     = 2 * x - 9
                  | otherwise = 2 * x

checksum :: Integer -> Integer
checksum = (`rem` 10) . sum . addends

isValid :: Integer -> Bool
isValid = (== 0) . checksum

create :: Integer -> Integer
create n = 10 * n + d
  where d = (10 - checksum') `rem` 10
        checksum' = checksum (10 * n)

revDigits :: Integer -> [Integer]
revDigits n | n < 10    = [n]
            | otherwise = r : revDigits q
  where (q, r) = n `quotRem` 10
