//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/05.
//

import Foundation

func getParent(_ parent: inout [Int], _ index: Int) -> Int {
    if parent[index] == index {
        return index
    } else {
        parent[index] = getParent(&parent, parent[index])
        return parent[index]
    }
}

func union(_ parent: inout [Int], _ from: Int, _ to: Int) {
    let num1 = getParent(&parent, from)
    let num2 = getParent(&parent, to)
    if num1 < num2 {
        parent[num2] = num1
    } else {
        parent[num1] = num2
    }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let costs = costs.sorted { $0[2] < $1[2] }
    var parentNode: [Int] = []
    var result = 0
    var lines: [[Int]] = []

    for i in 0..<n { parentNode.append(i) }
    
    for i in 0..<costs.count {
        
        if lines.count == n - 1 {
            break
        }
        let from = costs[i][0]
        let to = costs[i][1]
        if getParent(&parentNode, from) != getParent(&parentNode, to) {
            result += costs[i][2]
            lines.append(costs[i])
            union(&parentNode, from, to)
        }
    }

    if lines.count == 0 {
        return costs[0][2]
    }
        
    return result
}

let n = 3
let costs = [[0,1,3], [0, 2, 4]]
print(solution(n, costs))

