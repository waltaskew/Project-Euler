module Prime
    ( isPrime
    , primes
    , primeFactorization
    , factorCount
    ) where

import Data.List (find, genericLength, group)
import Data.Maybe (isNothing, fromJust)

divisibleBy :: Integer -> Integer -> Bool
divisibleBy x y = mod x y == 0

largestPossibleFactor :: Integer -> Integer
largestPossibleFactor x = floor . sqrt . fromIntegral $ x

isPrime :: Integer -> Bool                          
isPrime x
    | x < 2 = False
    | x < 4 = True -- 2 & 3 are prime
    | divisibleBy x 2 = False -- no even numbers except 2 are prime
    | x < 9 = True -- already excluded 4, 6 and 8
    | divisibleBy x 3 = False -- already allowed 3
    | otherwise = all (not . divisibleBy x) possiblePrimeFactors
    where
      {- all primes greater than 3 can be written in the form 6k+/-1
         so we want to test only these numbers as factors -}
      possiblePrimes = foldr (\x acc -> x: x + 2: acc) [] [5, 11 ..]
      possiblePrimeFactors = takeWhile (<= largestPossibleFactor x) possiblePrimes

primes :: [Integer]                             
primes = sieve [2..]
    where
      sieve (p:xs) = p : sieve[x|x <- xs, mod x p > 0]

primeFactorization :: Integer -> [Integer]                     
primeFactorization n = collectPrimeFactors n []
    where      
      collectPrimeFactors n factors =
          if isNothing maybeFactor
          then n : factors
          else collectPrimeFactors (div n primeFactor) (primeFactor : factors)
          where
            smallestPrimeFactor n = find
                                    (divisibleBy n)
                                    (takeWhile (<= largestPossibleFactor n) primes)
            maybeFactor = smallestPrimeFactor n
            primeFactor = fromJust maybeFactor

factorCount :: Integer -> Integer                          
factorCount n = foldl1
                (*)
                [genericLength ns + 1 | ns <- group (primeFactorization n)]
