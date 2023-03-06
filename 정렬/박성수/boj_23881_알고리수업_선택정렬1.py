# https://www.acmicpc.net/problem/23881
N, K = map(int, input().split())
arr = list(map(int, input().split()))
cnt = 0


for i in range(N-1, 0, -1): # N-1 ~ 1까지
    if arr[i] <= max(arr[:i]):
        cnt += 1
        # TODO: 배열 SWAP을 하기 전에 값들을 건들여야 한다.
        if cnt == K:
            k = [arr[i], arr[arr.index(max(arr[:i]))]]
            k.sort()
            print(' '.join(map(str, k)))
            break
        arr[i], arr[arr.index(max(arr[:i]))] = arr[arr.index(max(arr[:i]))], arr[i]


if cnt < K:
    print(-1)
