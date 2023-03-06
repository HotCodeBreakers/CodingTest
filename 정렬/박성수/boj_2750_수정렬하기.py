# https://www.acmicpc.net/problem/2750
N = int(input())
arr = []
for _ in range(N):
    arr.append(int(input()))

answer = []

for _ in range(N):
    print(min(arr))
    del arr[arr.index(min(arr))]
