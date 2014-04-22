isPythagoreanTriplet :: (Int, Int, Int) -> Bool
{-Return a boolean indicating whether the three given numbers
form a Pythagorean triplet.-}
isPythagoreanTriplet (a, b, c) = a^2 + b^2 == c^2

triplets :: [(Int, Int, Int)]
{-A list of tuples such that for tuple (a, b, c)
a < b < c and a + b + c == 1000-}

{-a can not be greater than 332 without pushing the triplet past 1000,
333 + 334 + 335 == 1002-}
triplets = outerLoop [1..332]
  where
    outerLoop [] = []
    outerLoop (a:as) = (innerLoop a [a + 1..bound]) ++ (outerLoop as)
      where
        {-possible values of b start at a + 1 (as b must be greater than a)
        and end with (1000 - 1 - a) `div` 2 as b must be small enough such
        that the triplet may contain a value c which is greater than b but
        does not push the sum of the triplet past 1000-}
        bound = (1000 - 1 - a) `div` 2

    innerLoop _ [] = []
    innerLoop a (b:bs) = (a, b, 1000 - a - b): innerLoop a bs

tripletProduct :: (Int, Int, Int) -> Int
{-Return the product of the triplet-}
tripletProduct (a, b, c) = a * b * c

answer = tripletProduct $ head $ filter isPythagoreanTriplet triplets

main = do print answer
