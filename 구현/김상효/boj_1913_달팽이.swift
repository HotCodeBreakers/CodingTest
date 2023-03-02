//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/10.
//

let n = Int(readLine()!)!
let value = Int(readLine()!)!

var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var squareCnt = (n + 1) / 2
var squareLength = n

var curX = 0
var curY = 0

var resultX = squareCnt - 1
var resultY = squareCnt - 1

for i in 0..<squareCnt-1 {
    curX = i
    curY = i
    matrix[curY][curX] = squareLength * squareLength
    for j in 0..<4 {
        for k in 1...squareLength-1 {
            if j == 3 && k == squareLength - 1 {
                break
            }
            curX += dx[j]
            curY += dy[j]
            matrix[curY][curX] = squareLength * squareLength - j * (squareLength - 1) - k
            
        }
    }
    squareLength -= 2
}

matrix[squareCnt-1][squareCnt-1] = 1

for i in 0..<n {
    for j in 0..<n {
        if matrix[i][j] == value {
            resultX = j
            resultY = i
        }
        print("\(matrix[i][j])", terminator: " ")
    }
    print()
}

print("\(resultY + 1) \(resultX + 1)")
