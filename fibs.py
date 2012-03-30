def iter_fibs():
    a, b = 1, 1
    while True:
        yield a
        a, b = b, a + b
