module CustomSet where

import Prelude hiding (minimum)

data Set a = Leaf | Node a Int (Set a) (Set a)

instance Eq a => Eq (Set a) where
  (==) = undefined

instance Show a => Show (Set a) where
  show = undefined

null :: Set a -> Bool
null Leaf = True
null _   = False

size :: Set a -> Int
size Leaf               = 0
size (Node _ count _ _) = count

empty :: Set a
empty = Leaf

-- | Construct a new Set without any rebalancing work.
node :: a -> Set a -> Set a -> Set a
node x l r = Node x (1 + size l + size r) l r

-- | Use after insertion or deletion, i.e. if the size of l or r has
-- changed by at most one element.
node' :: a -> Set a -> Set a -> Set a
node' v l r
  | ln + rn < 2    = p
  | rn > weight*ln = let (Node _ _ rl rr) = r
                     in if size rl < size rr
                          then singleRotateLeft p
                          else doubleRotateLeft p
  | ln > weight*rn = let (Node _ _ ll lr) = l
                     in if size lr > size ll
                          then singleRotateRight p
                          else doubleRotateRight p
  | otherwise      = p
  where
    ln = size l
    rn = size r
    p = node v l r

-- | Construct Set from subsets of arbitrary size.
-- All elements of l must be smaller than v, all elements of r greater than v.
join' :: a -> Set a -> Set a -> Set a
join' = undefined

-- | Balancedness criterion.
weight :: Int
weight = 4

singleRotateLeft :: Set a -> Set a
singleRotateLeft (Node a _ x (Node b _ y z)) = node b (node a x y) z
singleRotateLeft _ = error "Can't perform single left-rotation on this tree"

doubleRotateLeft :: Set a -> Set a
doubleRotateLeft (Node a _ x (Node c _ (Node b _ y1 y2) z)) =
    node b (node a x y1) (node c y2 z)
doubleRotateLeft _ = error "Can't perform double left-rotation on this tree"

singleRotateRight :: Set a -> Set a
singleRotateRight (Node b _ (Node a _ x y) z) = node a x (node b y z)
singleRotateRight _ = error "Can't perform single right-rotation on this tree"

doubleRotateRight :: Set a -> Set a
doubleRotateRight (Node c _ (Node a _ x (Node b _ y1 y2)) z) =
    node b (node a x y1) (node c y2 z)
doubleRotateRight _ = error "Can't perform double right-rotation on this tree"

member :: Ord a => a -> Set a -> Bool
member _ Leaf           = False
member x (Node y _ l r) = case compare x y of
                            LT -> x `member` l
                            GT -> x `member` r
                            EQ -> True

minimum :: Ord a => Set a -> a
minimum (Node v _ Leaf _) = v
minimum (Node _ _ l    _) = minimum l
minimum _                 = error "Empty set has no minimum"

insert :: Ord a => a -> Set a -> Set a
insert x Leaf           = Node x 1 Leaf Leaf
insert x (Node v _ l r) = case compare x v of
                              LT -> node' v (insert x l) r
                              GT -> node' v l (insert x r)
                              EQ  -> node x l r

delete :: Ord a => a -> Set a -> Set a
delete _ Leaf           = Leaf
delete x (Node v _ l r) = case compare x v of
                            LT -> node' v (delete x l) r
                            GT -> node' v l (delete x r)
                            EQ -> delete' l r

delete' :: Ord a => Set a -> Set a -> Set a
delete' Leaf r    = r
delete' l    Leaf = l
delete' l    r    = node' (minimum r) l (delmin r)

delmin :: Set a -> Set a
delmin (Node _ _ Leaf r) = r
delmin (Node v _ l    r) = node' v (delmin l) r
delmin _                 = error "Can't delete minimum of Leaf"

difference :: Set a -> Set a -> Set a
difference = undefined

fromList :: Ord a => [a] -> Set a
fromList = undefined

toList :: Set a -> [a]
toList = undefined

isDisjointFrom :: Set a -> Set a -> Bool
isDisjointFrom = undefined

intersection :: Set a -> Set a -> Set a
intersection = undefined

isSubsetOf :: Set a -> Set a -> Bool
isSubsetOf = undefined

union :: Set a -> Set a -> Set a
union = undefined
