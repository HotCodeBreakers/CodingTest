//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/27.
//
let n = Int(readLine()!)!
var matrix: [[String]] = []
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

var rgDifferent = 0
var rgSame = 0

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for _ in 0..<n {
    matrix.append(readLine()!.map { String($0) })
}

for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == false {
            bfs(i, j, true)
            rgDifferent += 1
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == false {
            bfs(i, j, false)
            rgSame += 1
        }
    }
}

print("\(rgDifferent) \(rgSame)")

func bfs(_ i: Int, _ j: Int, _ rgDifferent: Bool) {
    visited[i][j] = true
    var queue: [(Int, Int)] = [(i, j)]
    var head = 0
    
    while head < queue.count {
        let index = queue[head]
        let cury = index.0
        let curx = index.1
        
        for k in dx.indices {
            if curx + dx[k] >= n || cury + dy[k] >= n || curx + dx[k] < 0 || cury + dy[k] < 0 { continue }
            if visited[cury + dy[k]][curx + dx[k]] || !isSameColor(matrix[i][j], matrix[cury + dy[k]][curx + dx[k]], rgDifferent) { continue }
            visited[cury + dy[k]][curx + dx[k]] = true
            queue.append((cury + dy[k], curx + dx[k]))
        }
        
        head += 1
    }
    
}

func isSameColor(_ input: String, _ compare: String, _ rgDifferent: Bool) -> Bool {
    if rgDifferent {
        return input != compare ? false : true
    } else {
        if ["R", "G"].contains(input) && ["R", "G"].contains(compare) {
            return true
        } else { return input == compare ? true : false }
    }
}
