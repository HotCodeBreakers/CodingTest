//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/08.
//
let p = Int(readLine()!)!

for _ in 0..<p {
    var line: [Int] = []
    var cnt = 0
    line = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 2...20 {
        var idx = 1
        while idx < j {
            if line[idx] > line[j] {
                let removed = line.remove(at: j)
                line.insert(removed, at: idx)
                cnt += j - idx
                break
            }
            idx += 1
        }
    }
    print("\(line[0]) \(cnt)")
}
