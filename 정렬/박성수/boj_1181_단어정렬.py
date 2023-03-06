# https://www.acmicpc.net/problem/1181
N = int(input())

arr = set()
for _ in range(N):
    arr.add(input())

arr = list(arr)
arr.sort()
arr.sort(key=lambda x: len(x))
for i in arr:
    print(i)
