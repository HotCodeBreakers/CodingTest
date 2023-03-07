
let n = Int(readLine()!)!

var set: Set<String> = []

for _ in 0..<n {
    let word = readLine()!
    set.insert(word)
}

let ans = set.sorted {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

for i in ans {
    print(i)
}

