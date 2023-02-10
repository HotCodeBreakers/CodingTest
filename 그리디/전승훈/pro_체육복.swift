//
//  pro_체육복.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 0: 체육복이 필요한 사람, 99: 체육복을 빌려줄 수 있는 사람, 100: 여유가 있었는데 도난당해 빌려줄 수 없는 사람
    var arr: [Int] = Array(stride(from: 1, to: n+1, by: 1))
    var arrLost = lost
    var arrReserve = reserve
    
    for i in 0..<arrLost.count {
        for j in 0..<arrReserve.count {
            if arrReserve[j] == arrLost[i] {
                arrReserve[j] = 100
                arrLost[i] = 100
            }
        }
    }
    
    for i in 0..<arrLost.count {
        for j in 0..<arr.count {
            if arr[j] == arrLost[i] && arrLost[i] != 100 {
                arr[j] = 0
            }
        }
    }
    
    for i in 0..<arrReserve.count {
        for j in 0..<arr.count {
            if arr[j] == arrReserve[i] && arrReserve[i] != 100 {
                arr[j] = 99
            }
        }
    }
    
    for i in 0..<arr.count {
        if i == 0 {
            if arr[i] == 99 && arr[i+1] == 0 {
                arr[i+1] = i + 1
            }
        } else if i == arr.count-1 {
            if arr[i] == 99 && arr[i-1] == 0 {
                arr[i-1] = i - 1
            }
        } else {
            if arr[i] == 99 {
                if arr[i-1] == 0 && arr[i+1] != 0 {
                    if i - 1 == 0 {
                        // 0번째 위치한 값만 101로 예외 처리
                        arr[i-1] = 101
                    } else {
                        arr[i-1] = i - 1
                    }
                } else if arr[i-1] != 0 && arr[i+1] == 0 {
                    if i - 1 == 0 {
                        arr[i+1] = 101
                    } else {
                        arr[i+1] = i + 1
                    }
                } else if arr[i-1] == 0 && arr[i+1] == 0 {
                    if i - 1 == 0 {
                        arr[i-1] = 101
                    } else {
                        arr[i-1] = i - 1
                    }
                }
            }
        }
    }
    return arr.count - arr.filter{$0 == 0}.count
}

