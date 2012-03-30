import math
import sys

def is_palindrome_number(n):
    n_value = str(n)
    for index, char in enumerate(n_value[:n//2]):
        if char != n_value[-index - 1]:
            return False
    return True

def yield_three_digit_products():
    for i in range(100, 1000):
        for j in range(i, 1000):
            yield i * j

def naive():
    return max(i for i in yield_three_digit_products() if is_palindrome_number(i))

def factors_largest_to_smallest(n):
    factors = []
    for i in range(1, n):
        for j in range(i, n):
            factors.append((i * j, j, i))
    return sorted(factors, reverse=True)

print("factors of %d:" % 10)
for group in factors_largest_to_smallest(10):
    print group
#print("naive: %d" % naive())
