import Prime

answer = sum $ takeWhile (1999999 >) primes

main = do print answer
