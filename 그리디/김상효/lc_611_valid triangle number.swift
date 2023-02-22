//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/09.
//

import Foundation

class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var cnt = 0
        
        if sortedNums.count < 3 {
            return 0
        }
        
        for k in 2..<sortedNums.count {
            var i = 0
            var j = k - 1
            while i < j {
                if sortedNums[i] + sortedNums[j] > sortedNums[k] {
                    cnt += j - i
                    j -= 1
                } else {
                    i += 1
                }
            }
        }
        return cnt
    }
}

let sol = Solution()
let nums = [0,1 ,1 ,1]
print(sol.triangleNumber(nums))
