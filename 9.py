#! /home/walt/local/bin/python3.0
max_c = 997

def naive():
    for c in range(3, max_c):
        for b in range(2, c):
            for a in range(1, b):
                sum_of_values = a + b + c
                if sum_of_values == 1000 and a * a + b * b == c * c:
                    return a * b * c
                elif sum_of_values > 1000:
                    break

print(naive())
