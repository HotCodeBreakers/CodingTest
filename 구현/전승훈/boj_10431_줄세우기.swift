let p = Int(readLine()!)!

for i in 0..<p {
    var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    var ans = 0
    var t = i + 1
    
    for j in 2...20 {
        var idx = 1
        
        while idx < j {
            if arr[idx] > arr[j] {
                let change = arr.remove(at: j)
                arr.insert(change, at: idx)
                ans += j - idx
                break
            }
            idx += 1
        }
    }
    print("\(t) \(ans)")
}


