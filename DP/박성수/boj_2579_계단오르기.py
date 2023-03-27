N = int(input())
jumsu = []
for _ in range(N):
    jumsu.append(int(input()))

if N <3:
    print(sum(jumsu))
else:
    answer = [jumsu[0], jumsu[0] + jumsu[1], max(jumsu[0] + jumsu[2], jumsu[1]+jumsu[2])]

    for i in range(3, N):
        answer.append(max(answer[i-2], answer[i-3] + jumsu[i-1]) + jumsu[i])

    print(answer[N-1])
