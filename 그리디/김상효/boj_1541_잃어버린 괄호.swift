//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/03.
//
let input = readLine()!.split(separator: "-")
var value = input.compactMap {
    $0.split(separator: "+").reduce(0) {
        $0 + Int(String($1))!
    }
}
var result = value[0]

for i in 1..<value.count {
    result -= value[i]
}

print(result)
