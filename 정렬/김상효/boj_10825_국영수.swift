//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/08.
//

let n = Int(readLine()!)!
var students: [String: [Int]] = [:]

for _ in 0..<n {
    let student = readLine()!.split(separator: " ").map { String($0) }
    students[student[0]] = (1...3).map { Int(student[$0])! }
}

students.sorted {
    if $0.1[0] == $1.1[0] && $0.1[1] == $1.1[1] && $0.1[2] == $1.1[2]{
        return $0.0 < $1.0
    } else {
        if $0.1[0] == $1.1[0] && $0.1[1] == $1.1[1] {
            return $0.1[2] > $1.1[2]
        } else {
            if $0.1[0] == $1.1[0] {
                return $0.1[1] < $1.1[1]
            } else {
                return $0.1[0] > $1.1[0]
            }
        }
    }
}.forEach {
    print($0.0)
}
