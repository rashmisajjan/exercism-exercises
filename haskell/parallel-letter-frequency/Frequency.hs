module Frequency ( frequency ) where

import qualified Control.Parallel.Strategies as S
import Data.Char ( isLetter, toLower )
import qualified Data.Map as M
import qualified Data.Text as T

frequency :: Int -> [T.Text] -> M.Map Char Int
frequency _ ts = M.unionsWith (+) $ eval $ concatMap (T.chunksOf 50) ts
  where eval chunks = map frequency' chunks `S.using` S.parList S.rdeepseq

frequency' :: T.Text -> M.Map Char Int
frequency' = T.foldl' f M.empty . T.filter isLetter
  where f counts char = M.insertWith (+) (toLower char) 1 counts


-- use
-- T.chunksOf
-- force (evalute fully)
-- parList
-- rdeepseq
