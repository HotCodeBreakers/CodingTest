# https://www.acmicpc.net/problem/1449

N, L = map(int, input().split())
arr = list(map(int, input().split()))

arr.sort()
tapeCount = 1
coverage = arr[0] - 0.5 + L

for i in arr:
    if  i <= coverage:
        continue
    else:
        coverage = i - 0.5 + L
        tapeCount += 1

print(tapeCount)