import Data.List (foldl', maximumBy)
import Data.Function (on)
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

answer = fst $ maximumBy (compare `on` collatzLength)  $ zip numbers collatzSequences
  where
    collatzLength = length . snd
    numbers = [1..999999]
    collatzSequences = getCollatzs numbers

main = do print answer
