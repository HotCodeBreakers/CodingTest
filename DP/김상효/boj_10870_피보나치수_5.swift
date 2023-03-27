//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/27.
//

let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: 21)
dp[0] = 0
dp[1] = 1

if n >= 2 {
    for i in 2..<n+1 {
        dp[i] = dp[i-2] + dp[i-1]
    }
}

print(dp[n])
