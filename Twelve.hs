import qualified Prime
import qualified List

triangleNumbers :: [Integer]
triangleNumbers = 1 : zipWith (+) [2 ..] triangleNumbers

answer = head (dropWhile ((500 > ) . Prime.factorCount) triangleNumbers)