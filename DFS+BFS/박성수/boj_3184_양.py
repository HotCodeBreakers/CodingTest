# https://www.acmicpc.net/problem/3184
import sys
sys.setrecursionlimit(10**6)
row, col = map(int, input().split())
isVisited = [[0 for _ in range(col)] for _ in range(row)]
xx = [1, -1, 0, 0]
yy = [0, 0, 1, -1]

# #는 울타리, o는 양 v는 늑대
arr = []
for _ in range(row):
    arr.append(list(input()))

sheep = 0
wolf = 0


def dfs(i, j):
    global sheep
    global wolf
    isVisited[i][j] = 1
    if arr[i][j] == '#':
        isVisited[i][j] = 1
        return
    if arr[i][j] == 'o':
        sheep += 1
    if arr[i][j] == 'v':
        wolf += 1
    for k in range(4):
        dx = j + xx[k]
        dy = i + yy[k]
        if 0 <= dx < col and 0 <= dy < row:
            if isVisited[dy][dx] != 1 and arr[dy][dx] != '#':
                dfs(dy, dx)


totalSheep = 0
totalWolf = 0
for x in range(row):
    for y in range(col):
        if isVisited[x][y]:
            continue
        if arr[x][y] == '#':
            isVisited[x][y] = 1
            continue
        dfs(x, y)
        if sheep > wolf:
            totalSheep += sheep
        else:
            totalWolf += wolf
        sheep = 0
        wolf = 0

print(totalSheep, totalWolf)
