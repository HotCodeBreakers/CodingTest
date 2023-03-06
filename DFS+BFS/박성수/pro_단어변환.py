# https://school.programmers.co.kr/learn/courses/30/lessons/43163
answer = 0
def solution(begin, target, words):
    tempAnswerArray = [0]
    if target not in words:
        return 0

    isVisited = [0] * len(words)

    def checkDifference(baseWord):
        temp = 0
        tempArray = []
        for word in range(len(words)):
            for i in range(len(baseWord)):
                if words[word][i] != baseWord[i]:
                    temp += 1
            if temp == 1:
                tempArray.append(word)
            temp = 0
        return tempArray

    def DFS(start):
        global answer
        isVisited[start] = 1
        answer += 1

        if words[start] == target:
            tempAnswerArray.append(answer)
            answer = 0
            return
        if sum(isVisited) == len(isVisited):
            return
        compareArray = checkDifference(words[start])
        for i in compareArray:
            if words[i] == target:
                tempAnswerArray.append(answer+1)
                return
        print(compareArray)
        for k in compareArray:
            if isVisited[k] != 1:
                DFS(k)


    startArray = checkDifference(begin)
    print(startArray)
    for i in startArray:
        DFS(i)
        isVisited = [0] * len(words)
        answer = 0

    if len(tempAnswerArray) == 1:
        return 0
    del tempAnswerArray[0]
    print(tempAnswerArray)
    return min(tempAnswerArray)

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]	))

# answer = 0
#
#
# def solution(begin, target, words):
#     tempAnswerArray = [0]
#     if target not in words:
#         return 0
#
#     isVisited = [0] * len(words)
#
#     def checkDifference(baseWord):
#         temp = 0
#         tempArray = []
#         for word in words:
#             for i in range(len(baseWord)):
#                 if word[i] != baseWord[i]:
#                     temp += 1
#             if temp == 1:
#                 tempArray.append(i)
#             temp = 0
#         return tempArray
#
#     def DFS(start):
#         global answer
#         isVisited[start] = 1
#         answer += 1
#
#         if words[start] == target:
#             tempAnswerArray.append(answer)
#             return
#         if sum(isVisited) == len(isVisited):
#             return 0
#         compareArray = checkDifference(words[start])
#         print(compareArray)
#         for k in compareArray:
#             if isVisited[k] != 1:
#                 DFS(k)
#
#     for i in range(len(words)):
#         if isVisited[i] != 1:
#             DFS(i)
#             answer = 0
#         isVisited = [0] * len(words)
#
#     return min(tempAnswerArray)