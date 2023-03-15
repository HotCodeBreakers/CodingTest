//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/15.
//

let nc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nc[0]
let c = nc[1]
var arr: [Int] = []
var res = 0

for _ in 0..<n { arr.append(Int(readLine()!)!) }
arr.sort()

print(binarySearch(start: 1, end: arr.last! - arr[0]) )


func binarySearch(start: Int, end: Int) -> Int {
    var startIdx = start
    var endIdx = end
    
    while startIdx <= endIdx {
        
        var cnt = 1
        let mid = Int((startIdx + endIdx) / 2)
        var curHouse = arr[0]
        
        for i in arr.indices {
            if curHouse + mid > arr[i] { continue }
            else {
                cnt += 1
                curHouse = arr[i]
            }
        }
        
        if cnt >= c {
            res = mid
            startIdx = mid + 1
        } else {
            endIdx = mid - 1
        }
    }
    
    return res
}
