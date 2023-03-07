# https://www.acmicpc.net/problem/10825
# sort를 사용하면서 reverse하게 소팅하는 것은 x[0] 대신 -x[0]을 적어주면 된다.
N = int(input())

arr = []
for _ in range(N):
    a, b, c, d = map(str, input().split())
    arr.append([a, int(b), int(c), int(d)])

arr.sort(key=lambda x: (-x[1], x[2], -x[3], x[0]))

for i in arr:
    print(i[0])
