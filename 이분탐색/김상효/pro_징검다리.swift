//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/16.
//

import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    var rocksSort = ([0] + rocks.sorted() + [distance]).sorted()
    var distanceArr: [Int] = []
    for i in 0..<rocksSort.count - 1 {
        distanceArr.append(rocksSort[i + 1] - rocksSort[i])
    }
    
    func binarySearch(_ startIdx: Int, _ endIdx: Int) -> Int {
        var start = startIdx
        var end = endIdx
        var lastExcepted = false
        
        while start < end {
            let mid = Int((start + end) / 2)
            
            var cur = 0
            var deletedCnt = 0
            
            for i in 1..<rocksSort.count {
                if cur + mid > rocksSort[i] {
                    if i == rocksSort.count - 1 {
                        lastExcepted = true
                    } else {
                        deletedCnt += 1
                    }
                } else {
                    cur = rocksSort[i]
                }
            }
            
            if deletedCnt > n || lastExcepted {
                end = mid
            } else if deletedCnt <= n{
                start = mid + 1
            }
        }
        
        return start
    }
    return binarySearch(distanceArr.min()!, distanceArr.max()!) - 1
}

let distance = 25
let rocks = [2, 14, 11, 21, 17]
let n = 2
print(solution(distance, rocks, n))
