//
//  pro_큰 수 만들기.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let arrNumber: [Character] = Array(number)
    var count = k
    var ans: [Character] = []

    for i in arrNumber {

        while !ans.isEmpty && count > 0 &&
        ans.last!.wholeNumberValue! < i.wholeNumberValue! {
            ans.removeLast()
            count -= 1
        }

        if ans.count < arrNumber.count - k {
            ans.append(i)
        }
    }
    return String(ans)
}
