//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

import Foundation

let input = readLine()!.split(separator: "-").map {String($0)}
let first = input[0].split(separator: "+").map {Int(String($0))!}.reduce(0, +)

var totalMinus = 0

for i in 1 ..< input.count {
    let minus = input[i].split(separator: "+").map {Int(String($0))!}
    for j in minus {
        totalMinus += j
    }
}

print(first-totalMinus)
