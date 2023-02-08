# https://school.programmers.co.kr/learn/courses/30/lessons/42884
def solution(routes):
    answer = 0
    routes.sort(key=lambda x: x[1])
    list = [routes[0][1]]
    for i in range(1, len(routes)):
        if routes[i][0] <= list[-1] and routes[i][1] >= list[-1]:
            continue
        else:
            list.append(routes[i][1])

    answer = len(list)

    return answer