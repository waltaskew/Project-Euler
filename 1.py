import sys

stop = int(sys.argv[1])

def naive():
    global stop
    return sum(i for i in range(stop) if i % 3 == 0 or i % 5 == 0)

def sum_divisible_by(n):
    global stop
    p = stop // n
    return n * (p * (p + 1)) // 2

print("naive: %d" % naive())

print("smart: %d" % (sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)))
