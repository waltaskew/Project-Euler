limit = 1000

sumOfNSuccIntegers n = (n * (n + 1)) `div` 2

sumDivisibleBy n = (n *) $ sumOfNSuccIntegers $ limit `div` n

answer = sumDivisibleBy 3 + sumDivisibleBy 5 - sumDivisibleBy 15

main = do
  print answer


