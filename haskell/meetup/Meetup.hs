module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, addDays, fromGregorian, gregorianMonthLength)
import Data.Time.Calendar.WeekDate (toWeekDate)

data Weekday = PlaceHolder | Monday | Tuesday | Wednesday
             | Thursday | Friday | Saturday | Sunday
             deriving (Enum, Eq)

data Schedule = First | Second | Third | Fourth | Last | Teenth
              deriving (Enum, Eq)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = case schedule of
  Teenth ->
      firstWeekdayFrom weekday $ fromGregorian year month 13
  Last ->
      firstWeekdayFrom weekday beginLastWeek
      where beginLastWeek = fromGregorian year month (monthLength - 6)
            monthLength = gregorianMonthLength year month
  nth ->
      addDays (7 * asIntegral nth) firstWeekday
      where firstWeekday = firstWeekdayFrom weekday $ fromGregorian year month 1

firstWeekdayFrom :: Weekday -> Day -> Day
firstWeekdayFrom weekday day = addDays (diff `mod` 7) day
  where diff = asIntegral weekday - asIntegral (weekdayOn day)

weekdayOn :: Day -> Weekday
weekdayOn day = let (_, _, weekdayAsInt) = toWeekDate day
                in toEnum weekdayAsInt

asIntegral :: (Enum a, Integral b)  => a -> b
asIntegral = fromIntegral . fromEnum
