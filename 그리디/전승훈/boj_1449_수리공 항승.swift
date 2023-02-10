//
//  main.swift
//  Algorithm
//
//  Created by LeeJiSoo on 2023/02/01.
//

import Foundation

let insert1 = readLine()!.split(separator: " ").map{Int($0)!}
let insert2 = readLine()!.split(separator: " ").map{Int($0)!}
var leak = Array(repeating: true, count: 1001)
var count = 0
var ans = 0

for i in insert2 {
    leak[i] = false
}

while count <= 1000 {
    if leak[count] == false {
        count += insert1[1]
        ans += 1
    } else {
        count += 1
    }
}

print(ans)
