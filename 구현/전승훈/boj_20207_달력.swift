
var sum = Array(repeating: 0, count: 367)

let n = Int(readLine()!)!

for _ in 0..<n {
    let date = readLine()!.split(separator: " " ).map{ Int(String($0))! }
    sum[date[0]] += 1
    sum[date[1]+1] -= 1
}

var stack = [Int]()
var answer = 0

for i in 1...366 {
    sum[i] += sum[i-1]
    
    if sum[i] == 0 {
        if stack.isEmpty { continue }
        answer += stack[0]*stack[1]
        stack = []
    } else {
        if stack.isEmpty {
            stack = [1, sum[i]]
        } else {
            stack[0] += 1
            stack[1] = max(stack[1], sum[i])
        }
    }
}
print(answer)
