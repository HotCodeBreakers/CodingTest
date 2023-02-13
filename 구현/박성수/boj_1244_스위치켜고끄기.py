# https://www.acmicpc.net/problem/1244

switchNum = int(input())
switchStatus = list(map(int, input().split()))
peopleNum = int(input())

for _ in range(peopleNum):
    arr = list(map(int, input().split()))
    temp = arr[1]
    if arr[0] == 1:
        while 0 <= temp - 1 < len(switchStatus):
            switchStatus[temp - 1] = 1 - switchStatus[temp - 1]
            temp += arr[1]
    elif arr[0] == 2:
        switchStatus[temp - 1] = 1 - switchStatus[temp - 1]
        l = temp - 2
        r = temp
        while 0 <= l and r < len(switchStatus):
            if switchStatus[l] == switchStatus[r]:
                switchStatus[l], switchStatus[r] = 1 - switchStatus[l], 1 - switchStatus[r]
                l -= 1
                r += 1
            else:
                break

for i in range(len(switchStatus)):
    print(switchStatus[i], end=' ')
    if i % 20 == 19:
        print()

