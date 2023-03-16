//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/12.
//

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let valueArray = readLine()!.split(separator: " ").map { Int($0)! }

var valueDictionary: [Int: Int] = [:]
var resultArray: [Int] = []
array.sort()

for value in array {
    valueDictionary[value] = valueDictionary[value, default: 0] + 1
}

for value in valueArray {
    binarySearch(value: value, start: 0, end: n - 1)
}

print(resultArray.map{ String($0) }.joined(separator: " "))

func binarySearch(value: Int, start: Int, end: Int) {
    var endPoint = end
    var startPoint = start
    while startPoint <= endPoint {
        let mid = Int((startPoint + endPoint) / 2)
        
        if value == array[mid] {
            resultArray.append(valueDictionary[value]!)
            return
        }
        
        if array[mid] > value {
            endPoint = mid - 1
        } else  if array[mid] < value {
            startPoint = mid + 1
        }
    }
    resultArray.append(0)
}
