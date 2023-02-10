//
//  boj_1931_회의실 배정.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

let number = Int(readLine()!)!
var meeting: [[Int]] = []
var now = -1
var ans = 0

for _ in 0..<number{
    let time = readLine()!.split(separator: " ").map({Int($0)!})
    meeting.append(time)
}

meeting.sort { (a: [Int], b: [Int]) -> Bool in
    if a[1] == b[1]{
        return a[0] < b[0]
    } else {
        return a[1] < b[1]
    }
}

for i in meeting {
    if i[0] >= now {
        now = i[1]
        ans += 1
    }
}

print(ans)
