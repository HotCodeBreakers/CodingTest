//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/04.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let arr = number.map { Int(String($0))! }
    var deleteCnt = 0
    var stack: [Int] = []
    var idx = 0
    
    while deleteCnt != k, idx <= arr.count - 1 {
        if let top = stack.last {
            if top >= arr[idx] {
                stack.append(arr[idx])
                idx += 1
            } else {
                stack.popLast()
                deleteCnt += 1
            }
        } else {
            stack.append(arr[idx])
            idx += 1
        }
    }
    for i in idx ..< arr.count {
        stack.append(arr[i])
    }
    // 이 방법 대신 stack.append(contentsOf: arr[idx...]) 사용할 수 있음
    
    stack = Array(stack[0..<arr.count - k])
    return stack.reduce("") { $0 + String($1) }
}

let number = "4177252841"
let k = 6
print(solution(number, k))
