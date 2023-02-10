# https://www.acmicpc.net/problem/4796

arr = []
while True:
    k = list(map(int, input().split()))
    if k[0] == k[1] == k[2] == 0:
        break
    arr.append(k)

for i in range(len(arr)):
    answer = int(arr[i][2] % arr[i][1])
    if answer > arr[i][0]:
        answer = arr[i][0]
    print(f'Case {i+1}: {(arr[i][2] // arr[i][1]) * arr[i][0] + answer}')
