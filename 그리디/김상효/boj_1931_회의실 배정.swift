//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/02.
//
let n = Int(readLine()!)!
var timeTable = Array(repeating: Array(repeating: 0, count: 2), count: n)
var cnt = 0

for i in 0..<n {
    timeTable[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
timeTable = timeTable.sorted {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}


var start = 0
var end = 0

for time in timeTable {
    if end <= time[0] {
        start = time[0]
        end = time[1]
        cnt += 1
    }
}

print(cnt)
