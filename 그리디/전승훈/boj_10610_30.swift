//
//  boj_10610_30.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

let input = readLine()!.map {Int(String($0))!}

if input.contains(0) {
    let sum = input.reduce(0, +)
    if sum % 3 != 0 {
        print(-1)
    } else {
        let sortedInput = input.sorted(by: >)
        print(sortedInput.map{String($0)}.reduce("", +))
    }
} else {
    print(-1)
}
