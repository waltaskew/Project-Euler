import Prime
import Data.List

largestFactor = 20
factorRange = [2..largestFactor]

isDivisible :: Integral a => a -> a -> Bool
-- Return a Bool indicating whether x is divisible by y
isDivisible x y = x `mod` y == 0

isDivisibleByAll :: Integral a => a -> [a] -> Bool
-- Return a Bool indicating whether x is divisible by all numbers in xs
isDivisibleByAll x xs = all (isDivisible x) xs

factorsToTest :: [Integer]
{- Numbers in factorRange which are not factors of another number
in factorRange.  e.g. for the range [2..4], return [3, 4] omitting 2
because 2 is a factor of 4. -}
factorsToTest = filter factorOfAnother factorRange
  where
    factorOfAnother n = not $ any ((flip isDivisible) n) [n + 1..largestFactor]

findAnswer n = if isDivisibleByAll n factorsToTest
               then n
               else findAnswer (n + 2)

smallestPossible = foldl' (*) 1 $ filter isPrime factorRange

answer = findAnswer smallestPossible

main = do print answer
