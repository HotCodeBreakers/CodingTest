# https://www.acmicpc.net/problem/20207
N = int(input())
arr = []
answer = [0] * 366
for _ in range(N):
    arrk = list(map(int, input().split()))
    for k in range(arrk[0], arrk[1]+1):
        answer[k] += 1

start = 0
end = 0
height = 0
isVisited = [0] * 366
realAnswer = 0

for i in range(len(answer)):
    if answer[i] != 0:
        height = max(height, answer[i])
        end += 1
    elif answer[i] == 0:
        realAnswer += end * height
        height = 0
        end = 0

realAnswer += end * height # 가장 마지막 날까지 일정이 있을 경우에는 여기로 가야함

print(realAnswer)


# 시간 초과 풀이
# for i in range(1, len(answer)):
#     if isVisited[i] == 1:
#         continue
#     index = i
#     start = i
#     end = i
#     while True:
#         if answer[index] != 0:
#             height = max(height, answer[index])
#             end = index
#         else:
#             realAnswer += (end - start + 1) * height
#             height = 0
#             i = end
#             break
#
#         isVisited[index] = 1
#         index += 1