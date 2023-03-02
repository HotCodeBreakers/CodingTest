//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/07.
//

var sequence = readLine()!.uppercased().map { String($0) }
var dict: [String: Int] = [:]
var max: Int = 0
var maxValue: String = ""

for alphabet in sequence {
    if let cnt = dict[alphabet] {
        dict[alphabet] = cnt + 1
    } else {
        dict[alphabet] = 1
    }
}

for (key, value) in dict {
    if max < value {
        maxValue = key
        max = value
    } else if max == value {
        maxValue = "?"
    }
}

print(maxValue)

