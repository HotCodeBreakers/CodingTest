# https://www.acmicpc.net/problem/1541
a = input()
print(a)
arr = []
temp = ''

for i in a:
    if i != '-' and i != '+':
        temp += i
    elif i == '-' or i == '+':
        arr.append(int(temp))
        arr.append(i)
        temp = ''

arr.append(int(temp))

print(arr)
answer = 0
isVisited  = [0]*len(arr)

for idx, value in enumerate(arr):
    if isVisited[idx] == 0:
        if value == '-':
            index = idx + 1
            temp = 0
            while index < len(arr) and arr[index] != '-' and isVisited[index] != 1:
                if arr[index] != '+':
                    temp += arr[index]
                    isVisited[index] = 1
                index += 1
            answer -= temp
        else:
            if value != '+':
                answer += value
                isVisited[idx] = 1

print(answer)
