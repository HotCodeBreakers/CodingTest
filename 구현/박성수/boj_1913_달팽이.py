# https://www.acmicpc.net/problem/1913
N = int(input())
find = int(input())
arr = [[0 for _ in range(N)] for _ in range(N)]
startx = N // 2
starty = N // 2
arr[startx][starty] = 1
startx -= 1

num = 2
lens = 1
dir = 0 # 0: 오른쪽, 1: 아래, 2: 왼쪽, 3: 위로


while True:
    for i in range(lens):
        if num > N * N:
            break
        arr[startx][starty] = num
        num += 1
        if dir == 0:
            starty += 1
        elif dir == 1:
            startx += 1
        elif dir == 2:
            starty -= 1
        elif dir == 3:
            startx -= 1
    if num > N * N:
        break
    dir = (dir + 1) % 4
    if dir == 1 or dir == 3:
        lens += 1

answerx = 0
answery = 0
for i in range(len(arr)):
    for j in range(len(arr[0])):
        if find == arr[i][j]:
            answerx = i
            answery = j
        print(arr[i][j], end=' ')
    print()


print(answerx + 1, answery + 1)




