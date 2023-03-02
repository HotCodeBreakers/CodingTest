# https://www.acmicpc.net/problem/1138
N = int(input())

arr = list(map(int, input().split()))
answerArr = [0] * N

for i in range(N):
    count = 0
    for j in range(N):
        if count >= arr[i] and answerArr[j] == 0:
            answerArr[j] = i+1
            break
        elif answerArr[j] == 0:
            count += 1

print(' '.join(map(str, answerArr)))
