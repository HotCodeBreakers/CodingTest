//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/28.
//

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp: [Int] = Array(repeating: 0, count: n)
dp[0] = arr[0]

for i in 1..<n {
    dp[i] = arr[i]
    for j in stride(from: i-1, through: 0, by: -1) {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j] + arr[i])
        }
    }
}

print(dp.max()!)
