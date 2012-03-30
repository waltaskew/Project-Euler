import qualified Char

main = do
     print $ sumDigits number

number = 2 ^ 1000

getDigits x = map Char.digitToInt $ show x

sumDigits x = sum $ getDigits x
