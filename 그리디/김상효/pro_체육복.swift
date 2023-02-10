//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/04.
//

func share(_ students: inout [Int], _ from: Int, _ to: Int) -> [Int] {
    students[to] += 1
    students[from] -= 1
    return students
}

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var res = 0
    var students = Array(repeating: 1, count: n)
    
    for student in lost {
        students[student - 1] -= 1
    }
    
    for student in reserve {
        students[student - 1] += 1
    }
    
    if students[0] == 0 && students[1] == 2 {
        students = share(&students, 1, 0)
    }
    
    for i in 1..<students.count - 1 {
        if students[i] == 0 && students[i - 1] == 2 {
            students = share(&students, i - 1, i)
        } else if students[i] == 0 && students[i + 1] == 2 {
            students = share(&students, i + 1, i)
        }
    }
    
    if students[n - 1] == 0 && students[n - 2] == 2 {
        students = share(&students, n - 2, n - 1)
    }
    
    res = students.filter { $0 >= 1 }.count
    return res
}
