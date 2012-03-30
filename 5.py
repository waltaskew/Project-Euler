import math

def is_prime(n):
    if n == 2:
        return True
    else:
        largest_possible_factor = int(math.sqrt(n))
        for i in range(2, largest_possible_factor + 1):
            if n % i == 0:
                return False
        return True

def range_has_factor(range, factor):
    for n in range:
        if n % factor == 0:
            return True
    return False

def has_factor_in_list(n, factors_to_test):
    for factor in factors_to_test:
        if n % factor != 0:
            return False
    return True

def get_factors_to_test(n):
    return [i for i in range(2, n + 1) 
            if not range_has_factor(range(n, i, -1), i)]
            #if not range_has_factor(range(n, i, -1), i) and not is_prime(i)]

def smallest_divisible(n):
    min = reduce(lambda x, y: x * y, 
            (i for i in range(2, n + 1) if is_prime(i)))
    factors_to_test = get_factors_to_test(n)
    print factors_to_test
    possible = min
    while True:
        if not has_factor_in_list(possible, factors_to_test):
            possible += 2
        else:
            return possible

print smallest_divisible(20)
