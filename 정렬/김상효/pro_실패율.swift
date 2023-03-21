//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/17.
//


import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var sortedStages = stages.sorted()
    var stageFailed: [Int] = Array(repeating: 0, count: N+1)
    var stageTried: [Int] = Array(repeating: 0, count: N+1)
    var stage: [Int: Float] = [:]
    
    for value in sortedStages {
        if value != N + 1 {
            stageFailed[value] += 1
        }
    }
    
    for i in 1..<stageFailed.count {
        stageTried[i] = stageTried[i - 1] + stageFailed[i]
    }
    
    for i in 1..<N+1 {
        stage[i] = Float(stageFailed[i]) / (Float(sortedStages.count - stageTried[i - 1]) == 0 ? 1 : Float(sortedStages.count - stageTried[i - 1]))
    }
    print(stage)
    return stage.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }.map {
        Int($0.key)
    }
}
let N = 5
let stages = [2, 1, 2, 6, 2, 4, 3, 3]
print(solution(N, stages))
