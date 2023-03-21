//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/17.
//

let n = Int(readLine()!)!
var houses: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
houses.sort()

print(houses[(n - 1) / 2])
