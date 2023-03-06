# https://www.acmicpc.net/problem/2210
arr = []
answer = []
x = [1, -1, 0, 0]
y = [0, 0, 1, -1]

for _ in range(5):
    arr.append(list(map(str, input().split())))

tempAnswer = ''

def dfs(row, col):
    global tempAnswer
    if len(tempAnswer) == 6:
        if tempAnswer not in answer:
            answer.append(tempAnswer)
        return
    for i in range(4):
        dx = col + x[i]
        dy = row + y[i]
        if 0 <= dx < 5 and 0 <= dy < 5:
            tempAnswer += arr[dy][dx]
            dfs(dy, dx)
            # string값인 tempAnswer 마지막 값을 없애는 방법
            tempAnswer = tempAnswer[:-1]


for i in range(5):
    for j in range(5):
        dfs(i, j)


print(len(answer))
