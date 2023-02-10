# https://www.acmicpc.net/problem/1783
N, M = map(int, input().split())

if N == 1:
    print(1) # 이동불가
elif N == 2:
    print(min(4, (M + 1) // 2)) # 가로로 길어서 4칸을 채우거나, 작아서 /2한 만큼 가거나
else:
    if M <= 6:
        print(min(4, M)) # 최소 오른쪽으로 7은 가야 4방향 다 쓰는 것임, 그 이전이면, 가로 길이만큼 하나씩 접근은 가능
    else:
        print(M-2) # 4개 다 쓰고, 오른쪽으로 1개씩만 가는 것 카운팅해주니까 M-2