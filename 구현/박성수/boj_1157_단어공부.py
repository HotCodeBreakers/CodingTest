# https://www.acmicpc.net/problem/1157
word = input()

word = word.upper()
word = list(word)

arr = [0]*27
for i in word:
    arr[ord(i) - ord('A')] += 1

maxNum = max(arr)
maxCount = 0
temp = ''
for i in range(len(arr)):
    if maxNum == arr[i]:
        maxCount += 1
        temp = chr(i+ord('A'))


if maxCount == 1:
    print(temp)
else:
    print("?")



