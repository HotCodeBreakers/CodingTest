def solution(routes):
    answer = 1
    sortedRoutes = sorted(routes, key = lambda x: -x[0])
    checkPoint = sortedRoutes[0][0]
    
    checked = [0 for _ in range(len(routes))]

    for i in range(len(sortedRoutes)):
        
        if sortedRoutes[i][1] < checkPoint:
            answer += 1
            checkPoint = sortedRoutes[i][0]

    return answer

routes = [[-20,-15], [-14,-5], [-18,-13], [-5,-3]]
print(solution(routes))