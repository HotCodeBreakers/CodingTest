//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/12.
//

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
array.sort()
let m = Int(readLine()!)!

let valueArray = readLine()!.split(separator: " ").map { Int($0)! }

for value in valueArray {
    print(binarySearch(array: array, value: value, start: 0, end: n - 1) == true ? 1 : 0)
}

func binarySearch(array: [Int], value: Int, start: Int, end: Int) -> Bool {
    if start > end { return false }
    
    let mid = Int((start + end) / 2)
    
    if value == array[mid] { return true }
    
    if value < array[mid] {
        return binarySearch(array: array, value: value, start: start, end: mid - 1)
    } else if value > array[mid] {
        return binarySearch(array: array, value: value, start: mid + 1, end: end)
    }
    
    return false
}
