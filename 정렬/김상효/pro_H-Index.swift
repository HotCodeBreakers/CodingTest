//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/19.
//

func solution(_ citations:[Int]) -> Int {
    let sortedCitations = citations.sorted(by: >)
    let max = sortedCitations[0]
    var citationsArray = Array(repeating: 0, count: max + 1)

    for i in sortedCitations.indices {
        citationsArray[sortedCitations[i]] += 1
    }

    for i in stride(from: max - 1, through: 0, by: -1) {
        citationsArray[i] += citationsArray[i + 1]
    }

    for i in stride(from: max, through: 0, by: -1) {
        if citationsArray[i] >= i {
            return i
        }
    }

    return 0
}


let citations = [22, 47]
print(solution(citations))
