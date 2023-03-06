//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/28.
//

import Foundation

let dx = [1, 1, 1]
let dy = [-1, 0, 1]

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    let operationMatrix: [[String]] = [Array(repeating: "p", count: numbers.count), Array(repeating: "m", count: numbers.count)]
    dfs(0, 0, "p", numbers, target, result: &result, operationMatrix)
    dfs(1, 0, "m", numbers, target, result: &result, operationMatrix)
    return result
}

func dfs(_ i: Int, _ j: Int, _ operationString: String, _ numbers: [Int], _ target: Int, result: inout Int, _ operationMatrix: [[String]]) {
    if operationString.count == numbers.count {
        var sum = 0
        let opertaionArr = operationString.map { String($0) }
        for k in numbers.indices {
            sum = opertaionArr[k] == "p" ? sum + numbers[k] : sum - numbers[k]
        }
        if sum == target {
            result += 1
        }
    }
    
    for idx in dx.indices {
        let nx = j + dx[idx]
        let ny = i + dy[idx]
        
        if nx >= numbers.count || ny < 0 || ny >= 2 { continue }
        let opertaion = operationMatrix[ny][nx]
        dfs(ny, nx, operationString + opertaion, numbers, target, result: &result, operationMatrix)
    }
}

let numbers = [4, 1, 2, 1]
let target = 4
print(solution(numbers, target))
