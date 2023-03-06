R, C = map(int, input().split())
world =[]
isVisited = [[0 for _ in range(C)] for _ in range(R)]
dx = [1, -1, 0, 0]
dy = [0, 0, 1, -1]

for _ in range(R):
    world.append(list(input()))

startRow = 0
startCol = 0
waterStartRow = 0
waterStartCol = 0
waterStart = []
Drow = 0
Dcol = 0

for i in range(R):
    for j in range(C):
        if world[i][j] == '*':
            waterStartRow = i
            waterStartCol = j
            waterStart.append((i, j))
            isVisited[waterStartRow][waterStartCol] = 1
        if world[i][j] == 'S':
            startRow = i
            startCol = j
        if world[i][j] == 'X':
            isVisited[i][j] = 1
        if world[i][j] == 'D':
            Drow = i
            Dcol = j

def BFS():
    q = [(startRow, startCol)]
    # waterq = [(waterStartRow, waterStartCol)]
    waterq = waterStart
    while q:

        # tempPop = q.pop(0)
        a = len(waterq)
        # if waterq:
        #     waterPop = waterq.pop(0)

        while a:
            waterPop = waterq.pop(0)
            a -= 1

        # TODO: 그냥 물이 차는 것을 동일하게 BFS로 이미 방문한 위치라고 생각해주자
        # TODO: q에서 빼줄때, 해당 큐에 있는 것들을 다 빼주는 것이 좋을 것 같음
            for i in range(4):
                waterx = waterPop[1] + dx[i]
                watery = waterPop[0] + dy[i]
                if 0<=waterx<C and 0<= watery < R and world[watery][waterx] == '.' and isVisited[watery][waterx] == 0:
                    isVisited[watery][waterx] = 1
                    waterq.append((watery, waterx))

        b = len(q)
        while b:
            tempPop = q.pop(0)
            b -= 1
            for j in range(4):
                x = tempPop[1] + dx[j]
                y = tempPop[0] + dy[j]
                if 0<= x < C and 0<= y <R:
                    if world[y][x] == 'D':
                        isVisited[y][x] = isVisited[tempPop[0]][tempPop[1]] + 1
                        return
                    if isVisited[y][x] == 0 and (world[y][x] == '.' or world[y][x] == 'D'):
                        isVisited[y][x] = isVisited[tempPop[0]][tempPop[1]] + 1
                        # if world[tempPop[0]][tempPop[1]] == 'D':
                        #     return
                        q.append((y, x))


BFS()

if isVisited[Drow][Dcol] == 0:
    print("KAKTUS")
else:
    print(isVisited[Drow][Dcol])
