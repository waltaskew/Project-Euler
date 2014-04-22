fibs = 1: 2: zipWith (+) fibs (tail fibs)
onlyEven = filter even
smallish = takeWhile (< 40000)
answer = sum $ smallish $ onlyEven fibs

main = do
  print answer
