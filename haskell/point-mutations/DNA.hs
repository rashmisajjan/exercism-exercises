module DNA ( hammingDistance ) where


infixr 0 .:
(.:) :: (c -> d) -> (a -> b -> c) -> a -> b -> d
(.:) = (.) . (.)


hammingDistance :: [Char] -> [Char] -> Int
hammingDistance = length . filter id .: zipWith (/=)
