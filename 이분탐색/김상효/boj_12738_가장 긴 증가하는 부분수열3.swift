//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/14.
//

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var res: [Int] = [arr[0]]

for i in 1..<n {
    guard let last = res.last else { break }
    if last < arr[i] {
        res.append(arr[i])
    } else {
        binarySearch(start: 0, end: res.count - 1, value: arr[i])
    }
}

print(res.count)

func binarySearch(start: Int, end: Int, value: Int) {
    var startIdx = start
    var endIdx = end
    
    while startIdx <= endIdx {
        let mid = Int((startIdx + endIdx) / 2)
        
        if res[mid] == value {
            res[mid] = value
            return
        } else if res[mid] < value {
            startIdx = mid + 1
        } else {
            endIdx = mid - 1
        }
    }
    
    res[startIdx] = value
}

