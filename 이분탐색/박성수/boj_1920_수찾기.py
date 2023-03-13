# https://www.acmicpc.net/problem/1920
N = int(input())
firstArr = list(map(int, input().split()))

M = int(input())
secondArr = list(map(int, input().split()))

firstArr.sort()


def binarySearch(findNum):
    l = 0
    r = len(firstArr) - 1

    while l <= r:
        mid = (l + r) // 2
        target = firstArr[mid]
        if target == findNum:
            return 1
        elif target < findNum:
            l = mid + 1
        else:
            r = mid - 1

    return -1


for i in secondArr:
    a = binarySearch(i)
    if a == -1:
        print(0)
    else:
        print(1)

