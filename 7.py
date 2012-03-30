import math

def is_prime(n):
    if n < 2:
        return False
    elif n == 2:
        return True
    else:
        largest_possible_factor = int(math.sqrt(n))
        for i in range(2, largest_possible_factor + 1):
            if n % i == 0:
                return False
        return True

def naive(n):
    primes_found = 0
    possible_prime = 1
    while True:
        if is_prime(possible_prime):
            primes_found += 1
            if primes_found == n:
                return possible_prime
        possible_prime += 1

print naive(10001)
