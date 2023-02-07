# https://school.programmers.co.kr/learn/courses/30/lessons/42860
def solution(name):
    answer = 0
    nameArr = list(name)
    temp = []

    # min 처리로, 위에서 내려오는 것과 아래에서 올라가는 것의 최솟값 처리를 해줌
    for i in nameArr:
        temp.append(min(ord(i) - ord('A'), ord('Z') - ord(i) + 1))

    min_move = len(temp) - 1
    for i in range(len(temp)):
        index = i + 1
        # 좌우로 움직이는 Case를 3가지로 생각하고 풀이함... GOAT...
        while index < len(temp) and temp[index] == 0:
            index += 1
        min_move = min(min_move, 2 * i + len(temp) - index, 2 * (len(temp) - index) + i)

    answer = sum(temp)

    return answer + min_move
