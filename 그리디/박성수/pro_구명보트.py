# https://school.programmers.co.kr/learn/courses/30/lessons/42885
# def solution(people, limit):
#     answer = 0
#     people.sort(reverse=True)
#     isVisited = [0] * len(people)
#
#     for i in range(len(people)):
#         temp = limit
#         if sum(isVisited) == len(people):
#             break
#         if isVisited[i]:
#             continue
#         elif isVisited[i] != 1:
#             isVisited[i] = 1
#             temp -= people[i]
#             k = len(people) - 1
#             while temp > 0 and k >= 0:
#                 if isVisited[k] == 1:
#                     k -= 1
#                 else:
#                     temp -= people[k]
#                     k -= 1
#             if temp != 0:
#                 isVisited[k] = 0
#             answer += 1
#     return answer
#
#
# print(solution([80, 70, 50], 100))

# 문제를 잘읽자... 최대 2명...
def solution(people, limit):
    answer = 0
    people.sort()
    l = 0
    r = len(people) - 1

    while l <= r:
        answer += 1
        if people[l] + people[r] <= limit:
            l += 1
        r -= 1

    return answer