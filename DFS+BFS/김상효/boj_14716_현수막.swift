//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/28.
//

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0]
let n = mn[1]
var matrix: [[Int]] = []
var cnt = 0

for _ in 0..<m {
    matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<m {
    for j in 0..<n {
        if matrix[i][j] == 1 {
            dfs(i, j)
            cnt += 1
        }
    }
}

print(cnt)

func dfs(_ i: Int, _ j: Int) {
    let dy = [0, -1, -1, -1, 0, 1, 1, 1]
    let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
    
    for idx in dy.indices {
        let ny = i + dy[idx]
        let nx = j + dx[idx]
        
        if ny < 0 || nx < 0 || ny >= m || nx >= n { continue }
        if matrix[ny][nx] == 0 { continue }
        matrix[ny][nx] = 0
        dfs(ny, nx)
    }
}
