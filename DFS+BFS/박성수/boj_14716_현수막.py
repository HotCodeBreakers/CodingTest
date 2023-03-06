# https://www.acmicpc.net/problem/14716
import sys
sys.setrecursionlimit(10**6)
M, N = map(int, input().split())
world = []
isVisited = [[0 for _ in range(N)] for _ in range(M)]
answer = 0
dx = [1, -1, 0, 0, 1, -1, 1, -1]
dy = [0, 0, 1, -1, 1, 1, -1, -1]

for _ in range(M):
    world.append(list(map(int, input().split())))

def DFS(row, col):
    isVisited[row][col] = 1
    for i in range(8):
        x = col + dx[i]
        y = row + dy[i]
        if 0<= x < N and 0<= y < M:
            if isVisited[y][x] != 1 and world[y][x]:
                DFS(y, x)


for i in range(M):
    for j in range(N):
        if world[i][j] == 0:
            isVisited[i][j] = 1
            continue
        if not isVisited[i][j] and world[i][j]:
            DFS(i, j)
            answer += 1

print(answer)