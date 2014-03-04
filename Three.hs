import Prime
import Data.List

answer =  maximum $ primeFactorization 600851475143

main = do
  print answer
