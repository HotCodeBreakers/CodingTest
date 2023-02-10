//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/11.
//

let n = Int(readLine()!)!
var calendar = Array(repeating: 0, count: 366)
calendar += [0]

for _ in 0..<n {
    let se = readLine()!.split(separator: " ").map { Int($0)! }
    let s = se[0]
    let e = se[1]
    for i in s...e {
        calendar[i] += 1
    }
}

var width = 0
var maxValue = 0
var square = 0

for i in 1...366 {
    if calendar[i] > 0 {
        width += 1
        maxValue = max(maxValue, calendar[i])
    } else if calendar[i] == 0 {
        square += width * maxValue
        maxValue = 0
        width = 0
    }
}

print(square)
