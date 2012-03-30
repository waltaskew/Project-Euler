import math
import sys

def is_prime(n):
    largest_possible_factor = int(math.sqrt(n))
    for i in range(2, largest_possible_factor):
        if n % i == 0:
            return False
    return True

def yield_factors(n):
    largest_possible_factor = int(math.sqrt(n))
    for i in range(largest_possible_factor, 1, -1):
        if n % i == 0:
            yield i

def naive(n):
    for i in yield_factors(n):
        if is_prime(i):
            return i
    return n

to_factor = int(sys.argv[1])

print("naive: %d" % naive(to_factor))
