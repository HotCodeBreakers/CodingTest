//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/11.
//
var jMoney = Int(readLine()!)!
var sMoney = jMoney
var stockArr: [Int] = []

var jStockCnt = 0
var sStockCnt = 0
stockArr = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for i in 1..<stockArr.count {
    if jMoney >= stockArr[i] {
        jStockCnt += jMoney / stockArr[i]
        jMoney = jMoney % stockArr[i]
    }
}

var upCnt = 0
var downCnt = 0
for i in 2..<stockArr.count {
    if stockArr[i] > stockArr[i-1] {
        downCnt = 0
        upCnt += 1
        if upCnt >= 3 {
            sMoney += sStockCnt * stockArr[i]
            sStockCnt = 0
        }
    } else if stockArr[i] < stockArr[i-1] && sMoney >= stockArr[i] {
        upCnt = 0
        downCnt += 1
        if downCnt >= 3 {
            sStockCnt += sMoney / stockArr[i]
            sMoney = sMoney % stockArr[i]
        }
    }
}

jMoney += stockArr[stockArr.count - 1] * jStockCnt
sMoney += stockArr[stockArr.count - 1] * sStockCnt

print(jMoney >= sMoney ? jMoney == sMoney ? "SAMESAME" : "BNP" : "TIMING")

