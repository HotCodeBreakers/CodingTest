# https://www.acmicpc.net/problem/10816

N = int(input())
word = list(map(int, input().split()))
dic = {}
for i in word:
    if dic.get(i) is None:
        dic[i] = 1
    else:
        dic[i] += 1

M = int(input())
myCardList = list(map(int, input().split()))

for i in myCardList:
    if dic.get(i) is None:
        print(0, end=' ')
    else:
        print(dic[i], end=' ')
