import math

def is_prime(n):
    if n < 2:
        return False
    elif n < 4: # 2 and 3 are prime
        return True
    elif n % 2 == 0: # no even numbers except 2 are prime
        return False
    elif n < 9: # already excluded 4, 6 and 8
        return True
    elif n % 3 == 0: # already allowed 3
        return False
    else:
        largest_factor = int(math.sqrt(n)) # the largest possible factor of n
        factor = 5 # already excluded 2, 3 and 4 as factors earlier
        while factor <= largest_factor:
            if n % factor == 0:
                return False
            ## all primes greater than 3 can be written in the form 6k+/-1
            ## and we only need to test primes as factors, so we can skip
            ## every third odd number when looking at possible factors
            if n % (factor + 2) == 0:
                return False
            factor += 6 
        return True

def nth_prime(n):
    n -= 1 # enumerate counts from 0
    for count, prime in enumerate(iter_primes()):
        if count >= n:
            return prime

def iter_primes():
    yield 2
    yield 3
    candidate = 5
    while True:
        if is_prime(candidate):
            yield candidate
        candidate += 2
        if is_prime(candidate):
            yield candidate
        candidate += 4

def iter_primes_less_than(n):
    for prime in iter_primes():
        if prime >= n:
            return
        else:
            yield prime

def primes_up_to(limit):
    """Build a sieve which filters out non-primes, and then
    returns a list of primes less than @limit
    """
    cross_limit = int(math.sqrt(limit) - 1) // 2
    ## create a sieve to represent odd numbers less than limit
    ## the value represented by an index is 2 * index + 1
    sieve_limit = (limit - 1) // 2 + 1# last index of the sieve
    sieve = [True for i in range(sieve_limit)]
    sieve[0] = False # mark 1 as not prime

    for i in range(cross_limit):
        if sieve[i]: # 2 * i + 1 is not yet marked off, thus prime
            ## start marking off all multiples of the prime,
            ## beginning with its square (2 * i * (i + 1))
            ## multiples less than its sqaure have already been
            ## marked off by a lower prime
            for j in range(2 * i * (i + 1), sieve_limit, 2 * i + 1):
                sieve[j] = False
    # don't forget to add 2 to our list
    return [2] + [2 * index + 1 for index, is_prime 
            in enumerate(sieve) if is_prime]
