module School ( School, empty, add, sorted, grade ) where

import Data.List ( sort )
import qualified Data.Map.Strict as M

type Grade = Int
type Student = String
type School = M.Map Grade [Student]

empty :: School
empty = M.empty

add :: Grade -> Student -> School -> School
add grade' student school = M.insertWith addToClass grade' [student] school
  where addToClass new students = sort (new ++ students)

grade :: Grade -> School -> [Student]
grade = M.findWithDefault []

sorted :: School -> [(Grade, [Student])]
sorted = M.toAscList
