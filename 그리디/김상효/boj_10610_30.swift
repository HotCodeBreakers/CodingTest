//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/03.
//
var array = readLine()!.map { Int(String($0))! }
var res = 0

var checkContainZero: Bool {
    guard array.contains(0) else { return false }
    return true
}

var checkMultiplyOf3: Bool {
    return array.reduce(0) { $0 + $1 } % 3 == 0
}

if checkContainZero && checkMultiplyOf3 {
    array.sort(by: >)
    let joined = array.map { String($0) }.joined()
//    res = Int(array.sorted(by: >).reduce("") {
//        String($0) + String($1)
//    })!
    print(joined)
} else {
    print(-1)
}
