class History(object):
    def __init__(self):
        self.moves = []
        self.visited = {}

    def add_move(self, pos):
        self.moves.append(pos)
        self.visted[pos] = True

    def has_visited(self, pos):
        return pos in self.visited

class Board(object):
    def __init__(self, height, width):
        self.height = height
        self.width = width

    def is_valid_move(self, pos):
        x, y = pos
        if x < 0 or y < 0:
            return False
        elif x >= width or y >=height:
            return False
        else:
            return True

class Piece(object):
    def __init__(self, board, pos=(0, 0)):
        self.board = board
        self.history = History()
        self.pos = pos

    def possible_moves(self):
        return [pos
                for pos in ((x + 1, y), (x - 1, y)
                            (x, y + 1), (x, y - 1))
                if self.board.is_valid_move(pos) and
                not history.has_visited(pos)]

    def make_move(self, pos):
        self.history.add_move(pos)
        self.pos = pos
