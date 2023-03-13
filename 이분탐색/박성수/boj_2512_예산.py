# https://www.acmicpc.net/problem/2512
# 예산이 애초에 부족해서 0부터 시작해서 끝까지 가는 경우도 있다..

N = int(input())
request = list(map(int, input().split()))
maximum = int(input())
answer = 0


def check(limit):
    tempSum = 0
    for i in request:
        tempSum += min(i, limit)
    return tempSum


if sum(request) <= maximum:
    answer = max(request)
else:
    l = 0
    r = max(request)
    while l <= r:
        mid = (l + r) // 2
        temp = check(mid)

        if temp <= maximum:
            l = mid + 1
            answer = mid
        else:
            r = mid - 1

print(answer)

