# https://www.acmicpc.net/problem/20291
N = int(input())

arr = []
dic = {}
answerArr = []

for _ in range(N):
    temp = input().split(".")
    arr.append(temp)
    if not dic.get(temp[1]):
        dic[temp[1]] = 0
        answerArr.append(temp[1])
    dic[temp[1]] += 1

answerArr.sort()

for i in answerArr:
    print(i, dic[i])
