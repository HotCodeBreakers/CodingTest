let input = readLine()!.split(separator: " ").map{ Int($0)! }
let input2 = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0]
let k = input[1]

var arr = input2
var count = 0
var ans1 = 0
var ans2 = 0

for i in (0..<n).reversed() {
    let maxValue = arr[0...i].max()!
    
    if maxValue != arr[i] {
        let tmp = arr[i]
        arr[i] = maxValue
        arr[arr.firstIndex(of: maxValue)!] = tmp
        count += 1
        
        if count == k {
            ans1 = tmp
            ans2 = maxValue
        }
    }
}

if count < k {
    print(-1)
} else {
    print("\(ans1) \(ans2)")
}
