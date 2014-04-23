import Control.Exception.Base (assert)
import Data.Function (on)
import Data.List (foldl', maximumBy)
import qualified Data.Map.Strict as Map


collatz :: Int -> Map.Map Int [Int] -> ([Int], Map.Map Int [Int])
{-Produce the Collatz sequence starting with the given number, using
the given Map to memoize Collatz sequences.  Returns a tuple of the
sequence and an updated map for newly encountered Collatz sequences.-}
collatz 1 collatzMap = ([1], collatzMap)
collatz n collatzMap = (n: completeSeries, completeMap)
    where
      (completeSeries, completeMap) = case Map.lookup n collatzMap of
        Just v -> (v, collatzMap)
        Nothing -> (newSeries, Map.insert n newSeries newMap)
      (newSeries, newMap) = collatz (nextCollatz n) collatzMap

nextCollatz :: Int -> Int
{-Return the next number in the Collatz sequence-}
nextCollatz n
  | even n = div n 2
  | otherwise = 3 * n + 1

getCollatzs :: [Int] -> [[Int]]
{-Return the Collatz sequence for each number in the given list of numbers.-}
getCollatzs xs = doGetCollatzs xs Map.empty
  where
    doGetCollatzs [] _ = []
    doGetCollatzs (x:xs) collatzMap = series : doGetCollatzs xs newMap
      where
        (series, newMap) = collatz x collatzMap

longestCollatz :: [Int] -> Int
{-Return the number with the longest Collatz sequence in the
list of given numbers-}
longestCollatz numbers = fst $
                         maximumBy (compare `on` collatzLength) $
                         zip numbers collatzSequences
  where
    collatzLength = length . snd
    collatzSequences = getCollatzs numbers

answer = longestCollatz [1..999999]

main = do
  assert (getCollatzs [13, 2] == [[13,40,20,10,5,16,8,4,2,1], [2,1]]) (return ())
  assert (longestCollatz [2, 13, 1] == 13) (return ())
  print answer
