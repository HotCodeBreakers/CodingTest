//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/16.
//

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    
    func binarySearch(_ startIdx: Int, _ endIdx: Int) -> Int64 {
        var start = startIdx
        var end = endIdx
        
        while start < end {
            let mid = Int((start + end) / 2)
            var peopleCnt = 0
            
            times.forEach {
                peopleCnt += Int(mid / $0)
            }
            
            if peopleCnt >= n {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return Int64(start)
    }
    return binarySearch(0, times.last! * n)
}

let n = 6
let times = [7, 10]
print(solution(n, times))
