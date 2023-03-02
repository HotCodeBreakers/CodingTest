# https://www.acmicpc.net/problem/10026
import sys
sys.setrecursionlimit(10 ** 6)
N = int(input())
world = []
isVisited = [[0 for _ in range(N)] for _ in range(N)]
dx = [1, -1, 0, 0]
dy = [0, 0, 1, -1]

for _ in range(N):
    world.append(list(input()))

currentColor = ''

def dfs(x, y):
    isVisited[x][y] = 1
    currentColor = world[x][y]
    for i in range(4):
        xx = y + dx[i]
        yy = x + dy[i]
        if 0<= xx < N and 0<= yy < N:
            if isVisited[yy][xx] != 1 and currentColor == world[yy][xx]:
                dfs(yy, xx)

notJukrok = 0
for i in range(N):
    for j in range(N):
        if isVisited[i][j] != 1:
            dfs(i, j)
            notJukrok += 1

for i in range(N):
    for j in range(N):
        isVisited[i][j] = 0
        if world[i][j] == 'G':
            world[i][j] = 'R'

jukrok = 0
for i in range(N):
    for j in range(N):
        if isVisited[i][j] != 1:
            dfs(i, j)
            jukrok += 1

print(notJukrok, jukrok)
