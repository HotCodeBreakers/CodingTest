def solution(people, limit):
    answer = 0
    start = 0
    end = len(people) - 1
    people.sort()

    while start <= end:
        remain = limit - people[end]
        if people[start] <= remain:
            start += 1
        answer += 1
        end -= 1
    
    return answer

people = [70, 80, 50]
limit = 100
print(solution(people, limit))
