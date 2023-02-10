# https://school.programmers.co.kr/learn/courses/30/lessons/42883
# 처절한 실패..
# def solution(number, k):
#     answer = ''
#     arr = []
#     count = 0
#     for i in range(len(number) - 1):
#         if count == k:
#             if i < len(number) - 1:
#                 for k in range(i, len(number)):
#                     answer += number[k]
#             break
#         if int(number[i]) <= int(number[i + 1]):
#             answer += number[i + 1]
#             count += 1
#     return answer

# REF: https://happy-obok.tistory.com/15
def solution(number, k):
    number = list(number)
    answer = [number.pop(0)]
    for i in number:
        if answer[-1] < i:
            while answer and answer[-1] < i and k:
                answer.pop()
                k -= 1
            answer.append(i)
        elif k == 0 or answer[-1] >= i:
            answer.append(i)

    if k:
        answer = answer[:-k]
    answer = ''.join(answer)

    return answer