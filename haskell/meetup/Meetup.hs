module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar          (Day, fromGregorian,gregorianMonthLength,
                                    toGregorian)
import Data.Time.Calendar.WeekDate (toWeekDate)

data Weekday = PlaceHolder | Monday | Tuesday | Wednesday
             | Thursday | Friday | Saturday | Sunday
             deriving (Enum, Eq)

data Schedule = First | Second | Third | Fourth | Last | Teenth
              deriving (Enum, Eq)

selectWith :: Schedule -> [Day] -> Day
selectWith Teenth   = head . filter ((> 12) . monthDay)
selectWith Last     = last
selectWith schedule = (!! fromEnum schedule)

monthDay :: Day -> Int
monthDay day = let (_, _, md) = toGregorian day
               in md

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month
    = selectWith schedule $ filter rightWeekDay monthDays
  where
    rightWeekDay day = let (_, _, wdAsInt) = toWeekDate day
                       in wdAsInt == fromEnum weekday
    monthDays = map (fromGregorian year month)
                    [1 .. gregorianMonthLength year month]
