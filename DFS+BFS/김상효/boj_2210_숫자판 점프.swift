//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/20.
//
var matrix = Array(repeating: Array<Int>(), count: 5)
let dy = [-1, 0, 0, 1]
let dx = [0, 1, -1, 0]

for i in 0..<5 {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var numbers = Set<String>()

for i in 0..<5 {
    for j in 0..<5 {
        dfs(i, j, 0, "")
    }
}

func dfs(_ y: Int, _ x: Int, _ cnt: Int, _ newString: String) {
    guard cnt <= 5 else {
        numbers.insert(newString)
        return
    }
//    guard y >= 0 && y < 5 else { return }
//    guard x >= 0 && x < 5 else { return }
    
    for i in 0..<4 {
        if (0..<5).contains(y + dy[i]) && (0..<5).contains(x + dx[i]) {
            dfs(y + dy[i], x + dx[i], cnt + 1, newString + String(matrix[y][x]))
        }
    }
}

print(numbers.count)
