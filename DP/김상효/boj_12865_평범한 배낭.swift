//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/30.
//

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]
var stuffs: [(Int, Int)] = []
for _ in 0..<nk[0] {
    let stuff = readLine()!.split(separator: " ").map { Int($0)! }
    stuffs.append((stuff[0], stuff[1]))
}

var dp: [Int] = Array(repeating: 0, count: k+1)

for i in stuffs.indices {
    for j in stride(from: k, through: stuffs[i].0, by: -1) {
        dp[j] = max(dp[j], stuffs[i].1)
        dp[j] = max(dp[j], stuffs[i].1 + dp[j-stuffs[i].0])
    }
}


print(dp.max()!)
