
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var order = Array(repeating: 0, count: n)

for i in 0..<n {
    var count = 0
    
    for j in 0..<n {
        if count == arr[i] && order[j] == 0 {
            order[j] = i + 1
            break
        // 앞에 나온 수들은 무조건 현재의 i보다 작은 수들. 그러므로 order[j]에 아직 기입되지 않은 숫자만 counting
        } else if order[j] == 0 {
            count += 1
        }
    }
}

print(order.map{ String($0) }.joined(separator: " "))
