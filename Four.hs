import Data.List

isPalindrome [] = True
isPalindrome (_:[]) = True
isPalindrome xs = (head xs == last xs) && (isPalindrome $ init $ tail xs)

isPalindromicNumber = isPalindrome . show

allThreeDigitProducts = concatMap threeDigitProducts [100..999]
  where threeDigitProducts x = zipWith (*) [x..999] $ repeat x

palindromicThreeDigitNumbers = filter isPalindromicNumber allThreeDigitProducts

answer = maximum palindromicThreeDigitNumbers

main = do
  print answer
