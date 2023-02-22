# https://www.acmicpc.net/problem/15686
N, M = map(int, input().split())
arr = []

for _ in range(N):
    arr.append(list(map(int, input().split())))

chickenZipCount = 0
chicken = []
house = []

for i in range(N):
    for j in range(N):
        if arr[i][j] == 1:
            house.append([i, j])
        elif arr[i][j] == 2:
            chicken.append([i, j])

# 치킨 집 중 M개를 골라서 1과의 거리 체크 + 그 중 min값을 찾아야 함
isVisited = [0 for _ in range(len(chicken))]
realreal = []

def chickenVisit(current, index):
    if len(realVisit) == M:
        answer = 0
        tempAnswer = []
        for j in range(len(house)):
            for k in range(len(current)):
                tempAnswer.append(abs(house[j][0] - current[k][0]) + abs(house[j][1] - current[k][1]))
            answer += min(tempAnswer)
            tempAnswer = []
        realreal.append(answer)
        return
    else:
        for i in range(index, len(chicken)):
            if isVisited[i] != 1 and len(realVisit) != M:
                isVisited[i] = 1
                realVisit.append([chicken[i][0], chicken[i][1]])
                chickenVisit(realVisit, i)
                realVisit.pop()
                isVisited[i] = 0


realVisit = []
chickenVisit(realVisit, 0)
print(min(realreal))

