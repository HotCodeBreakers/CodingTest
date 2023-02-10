//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/02.
//

let nl = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nl[0]
let l = Double(nl[1])
var indexArr = readLine()!.split(separator: " ").map { Double(String($0))! }
indexArr = indexArr.sorted()

var startIndex: Double = indexArr[0] - 0.5
var endIndex: Double = startIndex + l
var cnt = 1

for i in 1..<n {
    if indexArr[i] >= endIndex {
        startIndex = indexArr[i] - 0.5
        endIndex = startIndex + l
        cnt += 1
    }
}

print(cnt)
