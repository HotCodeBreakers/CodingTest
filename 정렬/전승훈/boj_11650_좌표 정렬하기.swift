let n = Int(readLine()!)!

var arr: [(Int, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let x = input[0]
    let y = input[1]
    
    arr.append((x, y))
}

let sortedArr = arr.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

for i in sortedArr {
    print("\(i.0) \(i.1)")
}
