# https://school.programmers.co.kr/learn/courses/30/lessons/43238
def solution(n, times):
    answer = 0

    l = 1
    r = max(times) * n

    while l <= r:
        checkedPerson = 0
        mid = (l + r) // 2
        for time in times:
            checkedPerson += mid // time

        if checkedPerson >= n:
            r = mid - 1
        else:
            l = mid + 1

    return l