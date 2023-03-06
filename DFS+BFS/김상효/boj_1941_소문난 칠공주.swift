//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/27.
//

var matrix: [[String]] = []
var groupCnt = 0
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var stack: [Int] = []
var friendsCombination: [[Int]] = []
var result = 0

for _ in 0..<5 {
    matrix.append(readLine()!.map { String($0) })
}

combination(0, 25, 0)

friendsCombination.forEach {
    if moreThanFour(group: $0) && checkNear(group: $0) {
        result += 1
    }
}

print(result)
func combination(_ idx: Int, _ studentNum: Int, _ level: Int) {
    
    if level == 7 {
        friendsCombination.append(stack)
        return
    }
    
    for i in idx..<studentNum {
        stack.append(i)
        combination(i + 1, studentNum, level + 1)
        stack.popLast()
    }
}

func moreThanFour(group: [Int]) -> Bool {
    var s = 0
    var y = 0
    group.forEach {
        if matrix[$0 / 5][$0 % 5] == "S" {
            s += 1
        } else {
            y += 1
        }
    }
    
    return s >= 4 ? true : false
}

func checkNear(group: [Int]) -> Bool {
    var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: 5), count: 5)
    var queue: [(Int, Int)] = [(group[0] / 5, group[0] % 5)]
    var head = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let cury = node.0
        let curx = node.1
        
        for i in dx.indices {
            let ny = cury + dy[i]
            let nx = curx + dx[i]
            
            if nx >= 5 || ny >= 5 || nx < 0 || ny < 0 { continue }
            if visit[ny][nx] == true || !group.contains(ny * 5 + nx) { continue }
            queue.append((ny, nx))
            visit[ny][nx] = true
        }
        
        head += 1
    }
    
    for index in group {
        if visit[index / 5][index % 5] == false { return false }
    }
    
    return true
}
