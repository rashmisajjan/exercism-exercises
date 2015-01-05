module BST
  ( bstLeft
  , bstRight
  , bstValue
  , singleton
  , insert
  , fromList
  , toList
  ) where

import Data.List (foldl')

data BST a = BST { bstLeft :: Maybe (BST a)
                 , bstValue :: a
                 , bstRight :: Maybe (BST a)
                 }

singleton :: a -> BST a
singleton x = BST Nothing x Nothing

insert :: Ord a => a -> BST a -> BST a
insert x (BST l v r) = case compare x v of
                         GT -> BST l v (insertMaybe x r)
                         _  -> BST (insertMaybe x l) v r
  where insertMaybe y mbst = Just $ maybe (singleton y) (insert y) mbst

fromList :: Ord a => [a] -> BST a
fromList []     = error "empty list"
fromList (x:xs) = foldl' (flip insert) (singleton x) xs

toList :: BST a -> [a]
toList (BST l v r) = asList l ++ [v] ++ asList r
  where
    asList (Just b) = toList b
    asList _        = []
