# https://www.acmicpc.net/problem/14719
H, W = map(int, input().split())
arr = list(map(int, input().split()))
answer = 0

for i in range(1, len(arr)-1):
    k = min(max(arr[:i]), max(arr[i+1:]))
    if k > arr[i]:
        answer += k - arr[i]

print(answer)