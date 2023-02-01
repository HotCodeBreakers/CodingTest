def solution(n, lost, reserve):
    answer = 0
    arr = [1] * (n + 2)
    for i in reserve:
        arr[i] = 2
    for i in lost:
        arr[i] -= 1

    for i in range(1, n + 1):
        if arr[i] == 0:
            if arr[i - 1] == 2:
                arr[i - 1] -= 1
                arr[i] += 1
            elif arr[i + 1] == 2:
                arr[i + 1] -= 1
                arr[i] += 1

    answer = n - arr.count(0)
    return answer