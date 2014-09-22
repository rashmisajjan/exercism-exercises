module Binary where

import Data.List (foldl')
import Data.Maybe (fromMaybe)

toDecimal :: Integral a => String -> a
toDecimal = fromMaybe 0 . foldl' go (Just 0)
  where go (Just n) '0' = Just (2 * n)
        go (Just n) '1' = Just (2 * n + 1)
        go _        _   = Nothing
