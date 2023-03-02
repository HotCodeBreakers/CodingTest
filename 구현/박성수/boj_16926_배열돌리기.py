# REF: https://resilient-923.tistory.com/303
# https://www.acmicpc.net/problem/16926

import sys
input = sys.stdin.readline

N, M, R = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(N)]

for _ in range(R):
    temp = [[0 for _ in range(M)] for _ in range(N)]

    for i in range(min(N, M) // 2):
        downUp = N - i - 1
        rightLeft = M - i - 1
        # 위쪽: 우 -> 좌
        for j in range(i, rightLeft):
            temp[i][j] = arr[i][j+1]

        # 왼쪽: 위 -> 아래
        for j in range(i, downUp):
            temp[j][rightLeft] = arr[j+1][rightLeft]

        # 아래쪽: 왼쪽 -> 오른쪽
        for j in range(rightLeft, i, -1):
            temp[downUp][j] = arr[downUp][j-1]

        # 오른쪽: 아래 -> 위
        for j in range(downUp, i, -1):
            temp[j][i] = arr[j-1][i]
    arr = temp


for i in range(N):
    for j in range(M):
        print(arr[i][j], end=' ')
    print()
