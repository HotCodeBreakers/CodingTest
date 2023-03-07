# https://www.acmicpc.net/problem/11650
# 정렬순을 여러가지 기준을 줄 때, tuple 형식으로 값을 전달할 수 있음

N = int(input())

arr = []
for _ in range(N):
    arr.append(list(map(int, input().split())))

arr.sort()
# arr.sort(key=lambda x: (x[0], x[1]))

for i in arr:
    print(i[0], i[1])
