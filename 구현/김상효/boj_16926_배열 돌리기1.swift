//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/08.
//

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
var matrix: [[Int]] = Array(repeating: [],count: n)

for i in 0..<n {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var squareCnt = sqaureCount(n, m)

for i in 0..<squareCnt {
    for _ in 0..<r {
        rotateMatrix(n - 2 * i, m - 2 * i, matrix: &matrix, cnt: i)
    }
}

for i in 0..<n {
    matrix[i].forEach {
        print($0, terminator: " ")
    }
    print()
}

func sqaureCount(_ n: Int, _ m: Int) -> Int {
    var minLength = min(n, m)
    var cnt = 0
    while minLength != 0 {
        minLength -= 2
        cnt += 1
    }
    return cnt
}

func rotateMatrix(_ n: Int, _ m : Int, matrix: inout [[Int]], cnt: Int) {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    var curX = cnt
    var curY = cnt
    var tmp1 = matrix[curY][curY]
    var tmp2 = 0
    
    for i in 0..<dx.count {
        var moveCnt = 0
        let length = (i == 0 || i == 2) ? n : m
        while moveCnt < length - 1 {
            curX += dx[i]
            curY += dy[i]
            tmp2 = matrix[curY][curX]
            matrix[curY][curX] = tmp1
            tmp1 = tmp2
            moveCnt += 1
        }
    }
}
