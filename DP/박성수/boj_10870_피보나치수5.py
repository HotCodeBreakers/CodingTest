n = int(input())

arr = [0, 1]

def fibonacci(x):
    if x <= 1:
        return x
    return  fibonacci(x-2) + fibonacci(x-1)

# for i in range(2, n+1):
#     arr.append(arr[i-1] + arr[i-2])
# print(arr[n])

print(fibonacci(n))
