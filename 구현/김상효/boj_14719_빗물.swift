//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/10.
//
let hw = readLine()!.split(separator: " ").map { Int($0)! }
let h = hw[0]
let w = hw[1]
var heights: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var leftMax = 0
var rightMax = 0
var sum = 0

for i in 0..<w {
    leftMax = max(leftMax, heights[i])
    rightMax = 0
    for j in i..<w {
        rightMax = max(rightMax, heights[j])
    }
    
    let minHeight = min(leftMax, rightMax)
    
    sum += minHeight - heights[i]
}

print(sum)

