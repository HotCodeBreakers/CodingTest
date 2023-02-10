//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/03.
//
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

if n == 1 {
    print(1)
} else if n == 2 {
    if m <= 7 {
        print((m - 1) / 2 + 1)
    } else {
        print(4)
    }
} else {
    if m <= 4 {
        print((m - 1) + 1)
    } else if m < 7 {
        print(4)
    } else {
        print((m - 7) + 5)
    }
}

