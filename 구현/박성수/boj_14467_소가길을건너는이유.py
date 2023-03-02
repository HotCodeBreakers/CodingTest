# https://www.acmicpc.net/problem/14467
N = int(input())
arr = []
cowdic = {}
answer = 0

for i in range(N):
    arr.append(list(map(int, input().split())))

for i in arr:
    if cowdic.get(i[0]) is None:
        cowdic[i[0]] = i[1]
        continue

    if cowdic[i[0]] == i[1]:
        continue
    elif cowdic[i[0]] is not i[1]:
        answer += 1
        cowdic[i[0]] = i[1]

print(answer)
