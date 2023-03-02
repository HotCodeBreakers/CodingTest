//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/08.
//

let n = Int(readLine()!)!
var cows = Array(repeating: 2, count: 11)
var cnt = 0

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let cowNum = input[0]
    let roadNum = input[1]
    
    if cows[cowNum] != 2 && cows[cowNum] != roadNum {
        cnt += 1
    }
    cows[cowNum] = roadNum
}

print(cnt)
