//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/20.
//
// dfs로 풀었지만 bfs로 풀 수 있음
let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmk[0]
let m = nmk[1]
let k = nmk[2]

var matrix = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0..<k {
    let location = readLine()!.split(separator: " ").map { Int($0)! }
    matrix[location[0] - 1][location[1] - 1] = 1
}

var maxSize = 0
var cnt = 0

func dfs(_ x: Int, _ y: Int) {
    guard x >= 0 && x < m else { return }
    guard y >= 0 && y < n else { return }
    guard matrix[y][x] == 1 else { return }
    matrix[y][x] = 0
    cnt += 1
    dfs(x - 1, y)
    dfs(x, y + 1)
    dfs(x + 1, y)
    dfs(x, y - 1)
}

for i in 0..<n {
    for j in 0..<m {
        cnt = 0
        // matrix[i][j] == 1인 경우에 대해서만 dfs를 진행해서 시간을 줄일 수 있을듯
        dfs(j, i)
        maxSize = max(maxSize, cnt)
    }
}

print(maxSize)
