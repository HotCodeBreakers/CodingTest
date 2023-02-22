//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/09.
//

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let diffArr = (0..<gas.count).map { gas[$0] - cost[$0] }
        
        if diffArr.reduce(0, +) < 0 {
            return -1
        }
        
        var sum = 0
        var startIndex = 0
        
        for i in 0..<diffArr.count {
            sum += diffArr[i]
            
            if sum < 0 {
                startIndex = i + 1
                sum = 0
            }
        }
        
        return startIndex > diffArr.count ? -1 : startIndex
    }
}

let sol = Solution()
let gas = [2, 3, 4]
let cost = [3,4,3]
print(sol.canCompleteCircuit(gas, cost))
