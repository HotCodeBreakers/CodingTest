//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/27.
//

let n = Int(readLine()!)!
var stairs: [Int] = []
var dp: [Int] = Array(repeating: 0, count: n)
for _ in 0..<n { stairs.append(Int(readLine()!)!) }

if n == 1 {
    print(stairs[0])
} else if n == 2 {
    print(stairs[0] + stairs[1])
} else {
    dp[0] = stairs[0]
    dp[1] = max(stairs[1] + stairs[0], stairs[1])
    dp[2] = max(stairs[1]+stairs[2], stairs[0]+stairs[2])
    
    for i in 3..<n {
        dp[i] = max(dp[i-2]+stairs[i], stairs[i-1]+stairs[i]+dp[i-3])
    }
    print(dp[n-1])
}

