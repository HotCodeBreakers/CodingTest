//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/10.
//

let n = Int(readLine()!)!
let inputArray = readLine()!.split(separator: " ").map { Int($0)! }
var line = Array(repeating: 0, count: n)

for i in 0..<n {
    var cnt = 0
    let leftCnt = inputArray[i]
    
    for j in 0..<n {
        if line[j] == 0 {
            if cnt == leftCnt {
                line[j] = i + 1
                break
            } else {
                cnt += 1
            }
        } else {
            continue
        }
    }
}

line.forEach {
    print($0, terminator: " ")
}
