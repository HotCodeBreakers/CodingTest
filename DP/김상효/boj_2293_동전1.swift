//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/28.
//

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]
var coin: [Int] = []
var dp: [Int] = Array(repeating: 0, count: k+1)
for _ in 0..<n { coin.append(Int(readLine()!)!) }
coin.sort()

for i in 0..<n {
    for j in 1..<k+1 {
        if j == coin[i] {
            dp[j] += 1
        } else if j > coin[i] {
            dp[j] = dp[j] &+ dp[j - coin[i]]
        }
    }
}

print(dp[k])
