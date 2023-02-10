//
//  4796.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/02.
//

var cnt = 1

while true {
    
    let lpv: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let l = lpv[0]
    let p = lpv[1]
    let v = lpv[2]
    var res = 0
    
    if l == 0, p == 0, v == 0 { break }
    
    let division = v / p
    let extra = v % p
    let extraPossibleDay = extra > l ? l : extra
    
    res = division * l + extraPossibleDay
    
    print("Case \(cnt): \(res)")
    
    cnt += 1
}
