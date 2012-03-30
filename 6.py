def naive(n):
    sum_of_squares = sum(i * i for i in range(1, n + 1))
    square_of_sums = sum(i for i in range(1, n + 1))
    square_of_sums *= square_of_sums
    return square_of_sums - sum_of_squares

print naive(100)
