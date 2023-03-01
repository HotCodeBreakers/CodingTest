# https://school.programmers.co.kr/learn/courses/30/lessons/43164
answer = []
def solution(tickets):
    global answer
    tickets.sort(key=lambda x: x[1])
    isVisited = [0] * len(tickets)

    def DFS(start):
        global answer
        print(answer)
        if len(isVisited)  == sum(isVisited):
            answer.append(tickets[start][1])
            return answer
        else:
            for j in range(len(tickets)):
                if tickets[j][0] == tickets[start][1] and isVisited[j] != 1:
                    isVisited[j] = 1
                    answer.append(tickets[j][0])
                    DFS(j)
                    if len(answer) == len(tickets) + 1:
                        return
                    isVisited[j] = 0
                    answer.pop()

    for i in range(len(tickets)):
        if tickets[i][0] == 'ICN':
            isVisited[i] = 1
            answer.append(tickets[i][0])
            DFS(i)
            # ICN에서 시작해도 모든 곳을 돌지 못하고 서치가 끝나는 경우가 있기 때문에..!
        if len(answer) != len(isVisited) + 1:
            isVisited = [0] * len(tickets)
            answer = []
            continue
        else:
            break

    return answer

# TODO: backtracking을 사용했으니, 끝에 가서 갈리는 부분을 잘 생각해주자... 중복되는 부분도! 꼭 다시풀어보자
# print(solution([["ICN", "AAA"], ["ICN", "AAA"], ["ICN", "AAA"], ["AAA", "ICN"], ["AAA", "ICN"]]))