module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear y = 4 `divides` y && (not (100 `divides` y) || 400 `divides` y)

divides :: Int -> Int -> Bool
divides a b = b `rem` a == 0
