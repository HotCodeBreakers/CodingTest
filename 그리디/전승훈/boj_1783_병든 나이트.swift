//
//  boj_1783_병든 나이트.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}

let N = input[0]
let M = input[1]

if N == 1 {
    print(1)
} else if N == 2 {
    print(min(4,(M+1)/2))
} else {
    if M <= 6 {
        print(min(4,M))
    } else {
        print(M-2)
    }
}
