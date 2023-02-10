//
//  boj_4796_캠핑.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

for i in 0... {
    let testCase = readLine()!.split(separator: " ").map{$0}
    let V = Int(String(testCase[2]))!
    let P = Int(String(testCase[1]))!
    let L = Int(String(testCase[0]))!
    var count = 0
    
    if testCase[0] + " " + testCase[1] + " " + testCase[2] == "0 0 0" { break }
    
    count = (V / P) * L + min(L, V % P)
    
    print("Case \(i+1): \(count)")
}
