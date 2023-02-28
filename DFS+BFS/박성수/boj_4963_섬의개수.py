# https://www.acmicpc.net/problem/4963
import sys
sys.setrecursionlimit(10**6)

x = [1, -1, 0, 0, 1, 1, -1, -1]
y = [0, 0, -1, 1, 1, -1, 1, -1]
isVisited = []
worldMap = []
width = 0
height = 0
sumCount = 0


def DFS(ypos, xpos):
    isVisited[ypos][xpos] = 1
    for k in range(8):
        dx = xpos + x[k]
        dy = ypos + y[k]
        if 0 <= dx < width and 0 <= dy < height:
            if isVisited[dy][dx] != 1 and worldMap[dy][dx] == 1:
                DFS(dy, dx)


while True:
    width, height = map(int, input().split())
    if width == 0 and height == 0:
        break

    for _ in range(height):
        worldMap.append(list(map(int, input().split())))

    isVisited = [[0 for _ in range(width)] for _ in range(height)]
    for i in range(height):
        for j in range(width):
            if worldMap[i][j] == 0:
                isVisited[i][j] = 1
                continue
            if not isVisited[i][j] and worldMap[i][j]:
                DFS(i, j)
                sumCount += 1
    print(sumCount)
    sumCount = 0
    worldMap = []
    isVisited = []
