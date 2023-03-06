//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/27.
//
let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let dy = [0, -1, -1, -1, 0, 1, 1, 1]

while true {
    var islandCnt = 0
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == 0 && input[1] == 0 { break }
    
    let w = input[0], h = input[1];
    var matrix: [[Int]] = []
    //var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: w), count: h)
    
    for _ in 0..<h {
        matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    for i in 0..<h {
        for j in 0..<w {
            if matrix[i][j] == 1 {
                bfs(i, j, matrix: &matrix)
                islandCnt += 1
            }
        }
    }
    
    print(islandCnt)
}

func bfs(_ i: Int, _ j: Int, matrix: inout [[Int]]) {
    var queue: [(Int, Int)] = [(i, j)]
    var head = 0
    matrix[i][j] = 0

    while head < queue.count {
        let node = queue[head]
        let curx = node.1
        let cury = node.0
        
        for idx in dx.indices {
            let nx = curx + dx[idx]
            let ny = cury + dy[idx]
            
            if nx >= matrix[0].count || ny >= matrix.count || nx < 0 || ny < 0 { continue }
            if matrix[ny][nx] == 0 { continue }
            matrix[ny][nx] = 0
            queue.append((ny, nx))
        }
        
        head += 1
    }
}
