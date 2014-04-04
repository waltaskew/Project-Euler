sumOfSquares n = sum $ map (^2) [1..n]

squareOfSum n = (sum [1..n])^2

sumSquareDifference n = (squareOfSum n) - (sumOfSquares n)

answer = sumSquareDifference 100

main = do print answer

