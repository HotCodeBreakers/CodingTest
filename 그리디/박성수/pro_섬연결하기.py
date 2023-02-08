# https://github.com/HotCodeBreakers/CodingTest/issues/3
def solution(n, costs):
    answer = 99999999
    isVisited = [0] * n
    weightArr = [[0 for _ in range(n)] for _ in range(n)]
    tempAnswer = 0
    for i in costs:
        weightArr[i[0]] = i[2]
        weightArr[i[1]] = i[2]

    def DFS(start):
        if sum(isVisited) == n:
            global answer, tempAnswer
            answer = min(answer, tempAnswer)
            return
        for index, search in enumerate(weightArr[start]):
            if search != 0 and isVisited[index] != 1:
                isVisited[index] = 1
                tempAnswer += search
                DFS(index)
                tempAnswer -= search

    for i in range(n):
        DFS(i)
        isVisited = [0] * n

    return answer