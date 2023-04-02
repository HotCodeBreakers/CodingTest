//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/31.
//

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0]
let n = mn[1]
var matrix: [[Int]] = []
var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: n+1), count: m+1)
var cnt = 0
for _ in 0..<m { matrix.append(readLine()!.split(separator: " ").map { Int($0)! }) }

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

print(dfs(0, 0, matrix[0][0]))

func dfs(_ x: Int, _ y: Int, _ minimum: Int) -> Int {
    if y == m-1 && x == n-1 {
        return 1
    }
    
    if dp[y][x] == -1 {
        dp[y][x] = 0
        
        for idx in dy.indices {
            let nx = x + dx[idx]
            let ny = y + dy[idx]
            guard ny >= 0 && ny < m else { continue }
            guard nx >= 0 && nx < n else { continue }
            if matrix[ny][nx] < minimum {
                dp[y][x] += dfs(nx, ny, matrix[ny][nx])
            }
        }
    }
    
    return dp[y][x]
}
