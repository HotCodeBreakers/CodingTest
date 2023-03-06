# https://www.acmicpc.net/problem/1743
import sys
sys.setrecursionlimit(10**4)
N, M, K = map(int, input().split())

arr = [[0 for _ in range(M)] for _ in range(N)]
isVisited = [[0 for _ in range(M)] for _ in range(N)]

x = [1, -1, 0, 0]
y = [0, 0, 1, -1]


for _ in range(K):
    i, j = map(int, input().split())
    arr[i-1][j-1] = 1

answer = []
temp = 1

def DFS(row, col):
    global temp
    isVisited[row][col] = 1
    for i in range(4):
        dx = col + x[i]
        dy = row + y[i]
        if 0 <= dy < N and 0 <= dx < M and isVisited[dy][dx] == 0:
            if arr[dy][dx]:
                temp += 1
                DFS(dy, dx)


for i in range(N):
    for j in range(M):
        if arr[i][j]:
            if isVisited[i][j] == 0:
                DFS(i, j)
                answer.append(temp)
                temp = 1

DFS(0, 0)

print(max(answer))
