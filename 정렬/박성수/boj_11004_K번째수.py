# https://www.youtube.com/watch?v=ctkuGoJPmAE 나동빈 갓...
# 병합 정렬 비록 python은 C언어처럼 풀어서 시간 초과가 발생하지만, 병합정렬에 대해서 한수배웠습니다.

# import sys
# input = sys.stdin.readline
#
# N, K = map(int, input().split())
# arr = list(map(int, input().split()))
#
# arr = sorted(arr)
# print(arr[K-1])

N, K = map(int, input().split())
arr = list(map(int, input().split()))
newValue = [0] * len(arr)


def merge(a, left, mid, right):
    i = left
    j = mid + 1
    k = left

    while i <= mid and j <= right:
        if a[i] <= a[j]:
            newValue[k] = a[i]
            i += 1
        else:
            newValue[k] = a[j]
            j += 1
        k += 1

    # TODO: 먼저 끝남 놈이 있으면, 안끝난 놈을 끝까지 끝내주는 여유
    if i > mid:
        for temp in range(j, right+1):
            newValue[k] = a[temp]
            k += 1
    else:
        for temp in range(i, mid+1):
            newValue[k] = a[temp]
            k += 1

    # TODO: 정렬된 배열을 실제 배열로 옮겨주는 역할
    for i in range(left, right+1):
        arr[i] = newValue[i]


def merge_sort(a, left, right):
    # TODO: 배열 크기가 1보다 큰 경우
    if left < right:
        mid = (left + right) // 2
        merge_sort(a, left, mid)
        merge_sort(a, mid+1, right)
        merge(a, left, mid, right)


merge_sort(arr, 0, len(arr)-1)
print(arr[K-1])
