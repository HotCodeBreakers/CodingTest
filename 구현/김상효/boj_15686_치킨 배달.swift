//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/11.
//

// 조합 풀이
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var stack: [Int] = []
var storePointList: [(Int, Int)] = []
var storePointCombination: [[(Int, Int)]] = []

func combination(_ index: Int, maxCnt: Int, level: Int) {
    if level == m {
        var combi: [(Int, Int)] = []
        stack.forEach { combi.append(storePointList[$0]) }
        storePointCombination.append(combi)
        return
    }
    
    for i in index..<maxCnt {
        stack.append(i)
        combination(i + 1, maxCnt: maxCnt, level: level + 1)
        stack.popLast()
        
    }
}

func getDistance(_ p1: Int, _ p2: Int) -> Int {
    p1 >= p2 ? p1 - p2 : p2 - p1
}


var matrix: [[Int]] = []
for i in 0..<n {
    matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    for j in 0..<n {
        if matrix[i][j] == 2 {
            storePointList.append((i, j))
        }
    }
}

combination(0, maxCnt: storePointList.count, level: 0)

var minValue = 99999

storePointCombination.forEach {
    var minSum = 0
    for i in 0..<n {
        for j in 0..<n {
            if matrix[i][j] == 1 {
                var minDistance = 99999
                $0.forEach {
                    minDistance = min(getDistance($0.0, i) + getDistance($0.1, j), minDistance)
                }
                minSum += minDistance
            }
        }
    }
    minValue = min(minValue, minSum)
}

print(minValue)
