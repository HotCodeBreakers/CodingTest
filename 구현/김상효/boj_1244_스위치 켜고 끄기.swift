//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/08.
//

let switchCnt = Int(readLine()!)!
var switchStatusArr = [2] + readLine()!.split(separator: " ").map { Int($0)! }
let studentCnt = Int(readLine()!)!

for _ in 0..<studentCnt {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let sex = input[0]
    let switchNum = input[1]
    var stride = 0
    
    if sex == 1 {
        for i in 1...switchCnt {
            if i % switchNum == 0 {
                switchStatusArr[i] = switchStatusArr[i] == 1 ? 0 : 1
            }
        }
    } else {
        while switchNum - stride >= 1 && switchNum + stride <= switchCnt {
            if switchStatusArr[switchNum - stride] == switchStatusArr[switchNum + stride] {
                stride += 1
            } else { break }
        }
        stride -= 1
        for i in (switchNum - stride) ... (switchNum + stride) {
            switchStatusArr[i] = switchStatusArr[i] == 1 ? 0 : 1
        }
    }
}

for i in 1...switchCnt {
    if i % 20 == 0 {
        print("\(switchStatusArr[i])")
    } else {
        print(switchStatusArr[i], terminator: " ")
    }
    
    /*그냥 이렇게 하면 됨
    print(arr[i],terminator: " ")
        if i%20 == 0 {
            print()
        }
     */
}
