//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/06.
//

let n = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<n { arr.append(Int(readLine()!)!) }

for i in stride(from: n-1, through: 1, by: -1) {
    let maximum = arr[0..<i].max()!
    if maximum > arr[i] {
        let tmp = arr[i]
        arr[i] = maximum
        arr[arr.firstIndex(of: maximum)!] = tmp
    }
}

for value in arr {
    print(value)
}
