fibs = 1: 2: zipWith (+) fibs (tail fibs)
only_even = filter even
smallish = takeWhile (< 40000)
answer = sum $ smallish $ only_even fibs

main = do
  print answer
