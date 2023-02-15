var N = Int(readLine()!)!
var count = 0
var arr: [[Int]] = []
var dict: [Int : Int] = [:]

for i in 1...10 {
    dict[i] = 99
}

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    arr.append(input)
}

for i in arr {
    if dict[i[0]] == 99 {
        dict[i[0]] = i[1]
        continue
    }
    
    if dict[i[0]] != i[1] {
        dict[i[0]] = i[1]
        count += 1
    }
}

print(count)
