//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/08.
//

let n = Int(readLine()!)!
var wordArray = Array(repeating: [String](), count: 51)
var dictionary: [String: Bool] = [:]

for _ in 0..<n {
    let word = readLine()!
    if dictionary[word] == nil {
        dictionary[word] = true
        wordArray[word.count].append(word)
    }
}
for i in 1..<51 {
    wordArray[i].sorted().forEach {
        print($0)
    }
}

