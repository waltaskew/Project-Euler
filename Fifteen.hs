import qualified List

main = do
     print answer

size = 20

isValidPosition (x, y) = x < size && x >= 0 && y < size && y >= 0

isVisited = elem

availableMoves history = [pos | pos <- [(x + 1, y), (x - 1, y),
                                        (x, y + 1), (x, y - 1)],
                          not (isVisited pos history) && isValidPosition pos]
    where (x, y) = head history

isAtExit history = x == 19 && y == 19
    where (x, y) = head history

initialHistory = [(0, 0)]

collectHistories [] expandedHistories = expandedHistories
collectHistories unexpandedHistories expandedHistories = 
    collectHistories prunedHistories newHistories
        where availableHistories = concat [[availableMove : unexpandedHistory
                                                | availableMove <- availableMoves unexpandedHistory]
                                           | unexpandedHistory <- unexpandedHistories]
              (newHistories, prunedHistories) = List.partition isAtExit availableHistories

answer = collectHistories [initialHistory] []
