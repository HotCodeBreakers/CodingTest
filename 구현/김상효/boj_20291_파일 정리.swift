//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/11.
//
let n = Int(readLine()!)!
var extensionDict: [String: Int] = [:]
var extensionList: [String] = []

for _ in 0..<n {
    let fileName = readLine()!.split(separator: ".").map { String($0) }
    let fileExtension = fileName[1]
    
    if let extensionCnt = extensionDict[fileExtension] {
        extensionDict[fileExtension] = extensionCnt + 1
    } else {
        extensionDict[fileExtension] = 1
        extensionList.append(fileExtension)
    }
}

for name in extensionList.sorted() {
    print("\(name) \(extensionDict[name]!)")
}
