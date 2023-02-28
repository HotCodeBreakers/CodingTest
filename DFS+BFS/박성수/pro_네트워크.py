# https://school.programmers.co.kr/learn/courses/30/lessons/43162
def solution(n, computers):
    answer = 0
    arr = [0] * n
    isVisited = [0] * n

    def DFS(nodeNum):
        isVisited[nodeNum] = 1
        for k in range(n):
            if computers[nodeNum][k] and k != nodeNum and isVisited[k] != 1:
                DFS(k)

    for i in range(n):
        if isVisited[i] != 1:
            DFS(i)
            answer += 1

    return answer