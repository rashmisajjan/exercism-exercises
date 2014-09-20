module Clock where

import Text.Printf (printf)

newtype Clock = Clock Int
  deriving (Eq, Show)

instance Num Clock where
    Clock a + Clock b = fromHourMin 0 (a + b)
    Clock a - Clock b = fromHourMin 0 (a - b)
    Clock a * Clock b = fromHourMin 0 (a * b)
    abs = id
    signum (Clock 0) = 0
    signum (Clock _) = 1
    fromInteger = fromHourMin 0 . fromInteger

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock ((60 * h + m) `mod` (24 * 60))

toString :: Clock -> String
toString (Clock c) = printf "%02d:%02d" h m
  where (h, m) = c `quotRem` 60
