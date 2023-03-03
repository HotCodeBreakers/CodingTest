
let n = Int(readLine()!)!
var stack1: [Int] = []
var stack2: [Int] = []

for _ in 0..<n {
    let value = Int(readLine()!)!
    
    if stack1.isEmpty {
        stack1.append(value)
    } else {
        for _ in 0..<stack1.count {
            if stack1.last! < value {
                stack1.append(value)
                break
            } else {
                stack2.append(stack1.last!)
                stack1.removeLast()
                if stack1.isEmpty {
                    stack1.append(value)
                }
            }
        }
        stack1 = stack1 + stack2.reversed()
        stack2.removeAll()
    }
}

for i in stack1 {
    print(i)
}
