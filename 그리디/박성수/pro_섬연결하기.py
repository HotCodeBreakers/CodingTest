# https://github.com/HotCodeBreakers/CodingTest/issues/3

# DFS를 이용하려던 과거의 나 실패
# def solution(n, costs):
#     answer = 99999999
#     isVisited = [0] * n
#     weightArr = [[0 for _ in range(n)] for _ in range(n)]
#     tempAnswer = 0
#     for i in costs:
#         weightArr[i[0]] = i[2]
#         weightArr[i[1]] = i[2]
#
#     def DFS(start):
#         if sum(isVisited) == n:
#             global answer, tempAnswer
#             answer = min(answer, tempAnswer)
#             return
#         for index, search in enumerate(weightArr[start]):
#             if search != 0 and isVisited[index] != 1:
#                 isVisited[index] = 1
#                 tempAnswer += search
#                 DFS(index)
#                 tempAnswer -= search
#
#     for i in range(n):
#         DFS(i)
#         isVisited = [0] * n
#
#     return answer

def solution(n, costs):
    answer = 0
    arr = [i for i in range(n+1)]

    def get_parent(arr, x):
        if arr[x] == x:
            return x
        return get_parent(arr, arr[x])

    def union_parent(arr, x, y):
        x = get_parent(arr, x)
        y = get_parent(arr, y)
        if x < y:
            arr[y] = x
        else:
            arr[x] = y

    def compare_node(arr, x, y):
        x = get_parent(arr, x)
        y = get_parent(arr, y)
        if x == y:
            return True
        else:
            return False

    costs.sort(key=lambda x: x[2])
    count = 0
    for i in costs:
        if not compare_node(arr, i[0], i[1]):
            answer += i[2]
            union_parent(arr, i[0], i[1])
            count += 1

        if count == n-1:
            break

    return answer
