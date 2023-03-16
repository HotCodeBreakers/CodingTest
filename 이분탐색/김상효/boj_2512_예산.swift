//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/13.
//

let n = Int(readLine()!)!
var budgetArray = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var result: Int = 0

budgetArray.sort()
let minValue = budgetArray.min()!
let maxValue = budgetArray.max()!

if minValue > (m / n) {
    result = m / n
} else {
    binarySearch(start: minValue, end: maxValue)
}
print(result)

func binarySearch(start: Int, end: Int) {
    if start > end { return }
    var sum = 0
    
    let mid = Int((start + end) / 2)
    
    budgetArray.forEach { sum += $0 >= mid ? mid : $0 }
    
    if sum == m {
        result = mid
        return
    }
    
    if sum < m {
        result = mid
        binarySearch(start: mid + 1, end: end)
    } else if sum > m {
        binarySearch(start: start, end: mid - 1)
    }
}
