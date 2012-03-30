import qualified Prime

main = do
  print answer

limit = 10000

properDivisors n = filter (\ x -> rem n x == 0) [1..(div n 2)]

d n = sum $ properDivisors n
  
areAmicable (a, b)
  | a == b = False
  | otherwise = (d a) == b && (d b) == a
                
allPairs = concatMap pairs [1..limit]
  where
    pairs n = zip [1..limit] [n..limit]
    
answer = foldl (\ acc (x, y) -> acc + x + y) 0 $ filter areAmicable allPairs