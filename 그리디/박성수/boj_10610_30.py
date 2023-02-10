# https://www.acmicpc.net/problem/10610

tempstr = input()
#
# isVisited = [0]*len(tempstr)
# answer = ''
# answergot = 0
# def DFS(temp):
#     global answergot
#     if answergot:
#         return
#     if len(temp) == len(tempstr):
#         if int(temp) % 30 == 0:
#             print(int(temp))
#             answergot = 1
#             return
#         else:
#             return
#     for i in range(len(tempstr)):
#         if isVisited[i] != 1:
#             isVisited[i] = 1
#             DFS(temp + tempstr[i])
#             if answergot:
#                 return
#             isVisited[i] = 0
#
# DFS(answer)
# if answergot == 0:
#     print(-1)


if '0' not in tempstr:
    print('-1')
    exit()
else:
    answer = 0
    for i in range(len(tempstr)):
        answer += int(tempstr[i])

    if answer % 3 != 0:
        print('-1')
    else:
        a = sorted(tempstr, reverse=True)
        answer = "".join(a)
        print(answer)
