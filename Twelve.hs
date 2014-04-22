import Prime (factorCount)


triangleNumbers :: [Integer]
{-Triangle numbers are the sums of natural numbers.
1
1 + 2
1 + 2 + 3
1 + 2 + 3 + 4
and so on.
We define the sequence of triangle numbers here as the sum of
the previous triangle number and the next natural number.-}
triangleNumbers = 1 : zipWith (+) [2..] triangleNumbers

answer = head $ dropWhile ((500 > ) . factorCount) triangleNumbers

main = do print answer
