//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/02.
//

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0]
let c = rc[1]
var matrix: [[String]] = []

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for _ in 0..<r { matrix.append(readLine()!.map { String($0) }) }

var waterQueue: [(Int, Int)] = []
var waterHead = 0
var sQueue: [(Int, Int)] = []
var sHead = 0
var level = 0
var dIndex: (Int, Int) = (0, 0)
var minMove = 0

for i in 0..<r {
    for j in 0..<c {
        if matrix[i][j] == "*" {
            waterQueue.append((i, j))
        } else if matrix[i][j] == "S" {
            sQueue.append((i, j))
        } else if matrix[i][j] == "D" {
            dIndex = (i, j)
        }
    }
}

while true {
    
    if matrix[dIndex.0][dIndex.1] == "S" {
        minMove = level
        break
    }
    
    var sFlag = false
    for i in 0..<r {
        for j in 0..<c {
            if matrix[i][j] == "S" {
                sFlag = true
            }
        }
    }
    
    if !sFlag { break }
    
    let waterCount = waterQueue.count
    for i in waterHead..<waterCount {
        
        let y = waterQueue[i].0
        let x = waterQueue[i].1
        
        for idx in dy.indices {
            let ny = y + dy[idx]
            let nx = x + dx[idx]
            
            if ny < 0 || nx < 0 || ny >= r || nx >= c { continue }
            if ![".", "S"].contains(matrix[ny][nx]) { continue }
            waterQueue.append((ny, nx))
            matrix[ny][nx] = "*"
        }
    }
    
    waterHead = waterCount
    
    let sCount = sQueue.count
    for i in sHead..<sCount {
        let cury = sQueue[i].0
        let curx = sQueue[i].1
        
        for idx in dy.indices {
            let ny = cury + dy[idx]
            let nx = curx + dx[idx]
            
            if ny < 0 || nx < 0 || ny >= r || nx >= c { continue }
            if ["X", "*", "S"].contains(matrix[ny][nx]) { continue }
            sQueue.append((ny, nx))
            matrix[ny][nx] = "S"
        }
    }
    
    sHead = sCount
    
    level += 1
}

print(minMove == 0 ? "KAKTUS" : minMove)
