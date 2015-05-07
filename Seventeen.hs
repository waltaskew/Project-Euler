import Control.Exception.Base (assert)
import Data.Char (isSpace)
import Data.List (foldl')


asWord :: Int -> String
{-Return the English spelling of a given integer-}
asWord 1 = "one"
asWord 2 = "two"
asWord 3 = "three"
asWord 4 = "four"
asWord 5 = "five"
asWord 6 = "six"
asWord 7 = "seven"
asWord 8 = "eight"
asWord 9 = "nine"
asWord 10 = "ten"
asWord 11 = "eleven"
asWord 12 = "twelve"
asWord 13 = "thirteen"
asWord 14 = "fourteen"
asWord 15 = "fifteen"
asWord 16 = "sixteen"
asWord 17 = "seventeen"
asWord 18 = "eighteen"
asWord 19 = "nineteen"
asWord 20 = "twenty"
asWord 30 = "thirty"
asWord 40 = "forty"
asWord 50 = "fifty"
asWord 60 = "sixty"
asWord 70 = "seventy"
asWord 80 = "eighty"
asWord 90 = "ninety"
asWord n
  | n > 20 && n < 100 = tensPart ++ "-" ++ onesPart
  where
    onesPart = asWord (n `mod` 10)
    tensPart = asWord ((n `div` 10) * 10)
asWord n
  | n >= 100 && n < 1000 = hundredsPart ++ " hundred" ++ rest
  where
    hundredsPart = asWord (n `div` 100)
    rest = if (n `mod` 100) == 0
           then ""
           else " and " ++ asWord (n `mod` 100)
asWord n
  | n >= 1000 && n < 1000000 = thousandsPart ++ " thousand" ++ rest
  where
    thousandsPart = asWord (n `div` 1000)
    rest = if (n `mod` 1000) == 0
           then ""
           else " " ++ asWord (n `mod` 1000)

countChars :: String -> Int
{-Return the number of non-space and non-hyphen characters in a string.-}
countChars = foldl' count 0
  where
    count n char
      | isSpace char || char == '-' = n
      | otherwise = n + 1

countLetters :: [Int] -> Int
{-Return the number of letters in their English spelling
for the given list of numbers.-}
countLetters xs = sum $ map (countChars . asWord) xs

answer = countLetters [1..1000]


main = do
  assert (countLetters [1..5] == 19) (return ())
  assert (countLetters [342] == 23) (return ())
  assert (countLetters [115] == 20) (return ())
  print answer

