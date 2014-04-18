module Gigasecond (fromDay) where

import Data.Time.Calendar (Day, addDays)

fromDay :: Day -> Day
fromDay = addDays gigasecondInDays

gigasecondInDays :: Integer
gigasecondInDays = 10^9 `div` 60 `div` 60 `div` 24
