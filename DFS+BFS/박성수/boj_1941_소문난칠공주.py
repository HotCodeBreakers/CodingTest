# https://www.acmicpc.net/problem/1941
# https://kimmeh1.tistory.com/354
import sys
input = sys.stdin.readline
sys.setrecursionlimit(10**8)

arr = []
isVisited = [[0 for _ in range(5)] for _ in range(5)]
answer = 0
dx = [1, -1, 0, 0]
dy = [0, 0, 1, -1]

for _ in range(5):
    arr.append(list(input()))

selectPos = []
visit = set()

# TODO: 메인 아이디어는!!! 십자가 서치를 위해서 DFS 방문한 노드들을 대상으로 전체를 다시 DFS의 대상으로 보는 것이다.
def DFS(selectArr, S, Y):
    global answer
    if Y > 3:
        return
    if len(selectArr) == 7 and S >= 4:
        selectArr = tuple(sorted(selectArr))
        if selectArr not in visit:
            visit.add(selectArr)
            answer += 1
        return
    for select in selectArr:
        # TODO: x, y값으로 안다루고, 풀어서 만들어주는 이유는 -> sort해서 체크가 된 곳인지 아닌지를 쉽게 파악할 수 있으려고!! ()보다 값 한개가 파악하기 더 쉬움
        # y = select[0]
        # x = select[1]
        y = select // 5
        x = select % 5
        for i in range(4):
            yy = y + dy[i]
            xx = x + dx[i]
            if 0<= xx <5 and 0<= yy <5 and 5*yy+xx not in selectArr:
                selectArr.append(5*yy + xx)
                if arr[yy][xx] == 'Y':
                    DFS(selectArr, S, Y+1)
                else:
                    DFS(selectArr, S+1, Y)
                selectArr.pop()


for i in range(5):
    for j in range(5):
        if arr[i][j] == 'S':
            selectPos = []
            # selectPos.append((i, j))
            selectPos.append(i*5 + j)
            DFS(selectPos, 1, 0)

print(answer)
