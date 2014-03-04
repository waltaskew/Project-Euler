import Data.Char

main = do
     print $ sumDigits number

number = 2 ^ 1000

getDigits x = map digitToInt $ show x

sumDigits = sum . getDigits
