class LazyList(list):
    def __getitem__(self, y):
        try:
            return super(LazyList, self).__getitem__(y)
        except IndexError:
            self.extend_to_index(y)
            return super(LazyList, self).__getitem__(y)

    def extend_to_index(self, y):
        raise notImplementedError

class LazyTriangleList(LazyList):
    def __init__(self):
        super(LazyTriangleList, self).__init__((1,))

    def extend_to_index(self, y):
        last = self[-1]
        for i in range(len(self) + 1, y + 2):
            last += i
            self.append(last)
        
def count_factors(x):
    if x == 1:
        return 1
    else:
        # count all the factors from 2 to x//2, add 2 since 1 and x
        # are always factors of x
        return len([f for f in range(2, x//2 + 1) if x % f == 0]) + 2

def test():
    t = LazyTriangleList()
    assert t[0] == 1
    assert t[1] == 3
    assert t[6] == 28

    assert count_factors(t[1]) == 2
    assert count_factors(t[6]) == 6

if __name__ == '__main__':
    test()
