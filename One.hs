limit = 1000

sum_of_n_succ_integers n = (n * (n + 1)) `div` 2

sum_divisible_by n = (n *) $ sum_of_n_succ_integers $ limit `div` n

answer = sum_divisible_by 3 + sum_divisible_by 5 - sum_divisible_by 15

main = do
  print answer


