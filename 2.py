import sys

def generate_fibs_less_than(n):
    a, b = 1, 1
    while a < n:
        yield a
        a, b = b, a + b

def generate_even_fibs_less_than(n):
    first, second, third = 1, 1, 2
    while third < n:
        yield third
        first = second + third
        second = third + first
        third = first + second

def naive(n):
    return sum(i for i in generate_fibs_less_than(n) if i % 2 == 0)

def better(n):
    return sum(i for i in generate_even_fibs_less_than(n))

print("naive: %d" % naive(int(sys.argv[1])))
print("better: %d" % better(int(sys.argv[1])))
