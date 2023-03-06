//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/06.
//

import Foundation

let mk = readLine()!.split(separator: " ").map { Int($0)! }
let m = mk[0]
let k = mk[1]
var result = "-1"

var arr = readLine()!.split(separator: " ").map { Int($0)! }

var cnt = 0
var tmp = 0
for i in stride(from: m - 1, through: 1, by: -1) {
    let maximum = arr[0 ..< i].max()!
    if maximum > arr[i] {
        tmp = arr[i]
        arr[i] = maximum
        arr[arr.firstIndex(of: maximum)!] = tmp
        cnt += 1
    }
    
    if cnt == k {
        result = "\(tmp) \(maximum)"
        break
    }
}
print(result)
