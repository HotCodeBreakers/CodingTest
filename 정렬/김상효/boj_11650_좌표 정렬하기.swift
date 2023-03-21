//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/08.
//

let n = Int(readLine()!)!
var array: [(Int, Int)] = []

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((xy[0], xy[1]))
}

array.sorted {
    return $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 
}.forEach {
    print("\($0) \($1)")
}
