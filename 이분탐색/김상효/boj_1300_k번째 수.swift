//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/16.
//

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var result = 0

func binarySearch(_ start: Int, _ end: Int) {
    if start > end { return }
    
    let mid = Int((start + end) / 2)
    var cnt = 0
    for i in 1..<(n+1) {
        cnt += min(Int(mid/i), n)
    }
    
    if cnt < k {
        binarySearch(mid + 1, end)
    } else {
        result = mid
        binarySearch(start, mid - 1)
    }
}
binarySearch(0, n*n)
print(result)
