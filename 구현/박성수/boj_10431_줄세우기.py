# https://www.acmicpc.net/problem/10431
N = int(input())
arrs = []
for i in range(N):
    arrs.append(list(map(int, input().split())))

for i in arrs:
    del i[0]

temp = 1

count = 0
for arr in arrs:
    for i in range(len(arr)-1):
        for j in range(i+1, len(arr)):
            if arr[i] > arr[j]:
                count += 1

    print(temp, count)
    temp += 1
    count = 0