import qualified Char

main = do
     print answer

fac 1 = 1
fac n = n * fac (n - 1)

number = fac 100

getDigits x = map Char.digitToInt $ show x

answer = sum $ getDigits number