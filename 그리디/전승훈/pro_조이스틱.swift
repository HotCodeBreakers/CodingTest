//
//  pro_조이스틱.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//


import Foundation

func solution(_ name:String) -> Int {
    let name = name.utf8.map{ min(Int($0) - 65, 90 - Int($0) + 1) }
    let countUD = name.reduce(0, +)
    var countRL = name.count - 1
    
    let idx = 0
    for idxR in 0..<name.count {
        var idxL = idxR + 1
        while idxL < name.count && name[idxL] == 0 {
            idxL += 1
        }
        let compareDistance = min(idxR - idx, name.count - idxL)
        countRL = min(countRL, (idxR - idx) + (name.count - idxL) + compareDistance)
    }
    
    return countUD + countRL
}
