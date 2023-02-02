# https://www.acmicpc.net/problem/1931

N = int(input())
arr = []
for _ in range(N):
    arr.append(list(map(int, input().split())))

arr.sort(key= lambda x: x[0])
arr.sort(key= lambda x: x[1]) # x[1] 기준으로만 정렬하면 오답임, 시작시간을 오름차순으로 맞춰주고, 이후에 끝나는 시간이 빠른 놈으로 정렬
count = 1
endTime = arr[0][1]
for i in range(1, len(arr)):
    if endTime <= arr[i][0]:
        count += 1
        endTime = arr[i][1]

print(count)
