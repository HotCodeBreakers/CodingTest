
let n = Int(readLine()!)!
var dict: [String : Int] = [:]

for _ in 0..<n {
    let extensionName = Array(readLine()!.split(separator: ".").map{String($0)})[1]
    
    if dict[extensionName] == nil {
        dict[extensionName] = 1
    } else {
        dict[extensionName]! += 1
    }
}

let sortedDict = dict.sorted { $0.0 < $1.0 }

for i in sortedDict {
    print("\(i.key) \(i.value)")
}
