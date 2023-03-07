let n = Int(readLine()!)!
var data: [(String, Int, Int, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    let name = input[0]
    let korean = Int(input[1])!
    let english = Int(input[2])!
    let math = Int(input[3])!
    data.append((name, korean, english, math))
}

let sortedData = data.sorted {
    if $0.1 != $1.1 {
        return $0.1 > $1.1
    } else if $0.2 != $1.2 {
        return $0.2 < $1.2
    } else if $0.3 != $1.3 {
        return $0.3 > $1.3
    } else {
        return $0.0 < $1.0
    }
}

for i in sortedData {
    print(i.0)
}
