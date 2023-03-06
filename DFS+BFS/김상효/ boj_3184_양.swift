//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/27.
//
let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0]
let c = rc[1]
var matrix: [[String]] = []
var totalSheep = 0
var totalWolf = 0

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for _ in 0..<r {
    matrix.append(readLine()!.map{ String($0) })
}

for i in 0..<r {
    for j in 0..<c {
        var sheepCnt = 0
        var wolfCnt = 0
        if [".", "v", "o"].contains(matrix[i][j]) {
            dfs(i, j, &sheepCnt, &wolfCnt)
        }
        if sheepCnt > wolfCnt {
            totalSheep += sheepCnt
        } else {
            totalWolf += wolfCnt
        }
    }
}

print("\(totalSheep) \(totalWolf)")


func dfs(_ i: Int, _ j: Int, _ sheep: inout Int, _ wolf: inout Int) {
    
    if matrix[i][j] == "v" {
        wolf += 1
    } else if matrix[i][j] == "o" {
        sheep += 1
    }
    matrix[i][j] = "#"
    
    for k in 0..<dx.count {
        if i + dy[k] >= 0 && i + dy[k] < r && j + dx[k] >= 0 && j + dx[k] < c && matrix[i + dy[k]][j + dx[k]] != "#" {
            dfs(i + dy[k], j + dx[k], &sheep, &wolf)
        }
    }
}
