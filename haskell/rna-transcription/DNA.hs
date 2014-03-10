module DNA (toRNA) where

-- | toRNA returns the RNA complement for a given DNA strand.
toRNA :: String -> String
toRNA = map f
  where f 'G' = 'C'
        f 'C' = 'G'
        f 'T' = 'A'
        f 'A' = 'U'
        f _   = undefined
