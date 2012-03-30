import qualified Data.List as List

main = do
     print answer

iterSequence n = buildSequence n []
    where
      buildSequence 1 acc = reverse (1 : acc)
      buildSequence n acc = buildSequence (next n) (n : acc)
      next n
          | even n = div n 2
          | otherwise = 3 * n + 1

answer = List.foldl' holdMax (0, 0)  [1 .. 999999]
    where
      holdMax acc@(max, num) n =
          if sequenceLength > max
          then (sequenceLength, n)
          else acc
              where sequenceLength = length . iterSequence $ n