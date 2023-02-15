import Foundation

let budget = Int(readLine()!)!
let stockPrice = readLine()!.split(separator: " ").map{ Int($0)! }

var bnpBudget = budget
var timingBudget = budget
var bnpStock = 0
var timingStock = 0
var statusPlus = 0
var statusMinus = 0

for i in 0..<stockPrice.count {
    // 준현이 (살 수 있을 때 최대로 구매, 한 번 사면 끝까지 홀딩)
    bnpStock += bnpBudget / stockPrice[i]
    bnpBudget -= (bnpBudget / stockPrice[i]) * stockPrice[i]
    
    // 성민이 (연속 3일 오를때 풀 매도, 연속 3일 떨어질때 풀 매수)
    if i > 0 {
        if stockPrice[i] > stockPrice[i - 1] {
            statusPlus += 1
            statusMinus = 0
        } else if stockPrice[i] < stockPrice[i - 1] {
            statusPlus = 0
            statusMinus += 1
        } else {
            statusPlus = 0
            statusMinus = 0
        }
        
        if statusPlus >= 3 {
            timingBudget += timingStock * stockPrice[i]
            timingStock = 0
        }
        
        if statusMinus >= 3 {
            timingStock += timingBudget / stockPrice[i]
            timingBudget -= (timingBudget / stockPrice[i]) * stockPrice[i]
        }
    }
}

let BNP = bnpBudget + bnpStock * stockPrice[13]
let TIMING = timingBudget + timingStock * stockPrice[13]

if BNP > TIMING {
    print("BNP")
} else if BNP < TIMING {
    print("TIMING")
} else {
    print("SAMESAME")
}
