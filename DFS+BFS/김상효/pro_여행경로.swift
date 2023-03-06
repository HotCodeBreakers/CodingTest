//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/01.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var cities: [String] = []
    var dic: [String: Int] = [:]
    tickets.forEach {
        cities += $0
    }
    
    let sortedCities = Set(cities).sorted()
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: sortedCities.count), count: sortedCities.count)
    
    func cityNum(_ cityName: String, _ dic: [String: Int]) -> Int {
        return dic[cityName]!
    }
    
    func numToCity(_ num: Int, _ dic: [String: Int]) -> String {
        for (key, value) in dic {
            if value == num {
                return key
            }
        }
        return ""
    }
    
    func dfs(_ i: Int, _ j: Int, _ arr: [Int], _ mat: [[Int]]) -> [Int] {
        var matrix = mat
        matrix[i][j] -= 1
        var result: [Int] = []
        
        if arr.count == tickets.count + 1  {
            return arr
        }
        
        for k in 0..<matrix.count {
            if matrix[j][k] > 0 {
                let value = dfs(j, k, arr + [k], matrix)
                if value.count == tickets.count + 1 {
                    result = value
                    break
                }
            }
        }
        
        return result
    }
    
    for i in 0..<sortedCities.count {
            dic[sortedCities[i]] = i
    }
    
    for i in tickets.indices {
        let node = tickets[i]
        let fromNum = cityNum(node[0], dic)
        let toNum = cityNum(node[1], dic)
        matrix[fromNum][toNum] += 1
    }
    
    var result: [String] = []
    for i in 0..<sortedCities.count {
        for j in 0..<sortedCities.count {
            if matrix[i][j] > 0 && numToCity(i, dic) == "ICN" {
                let value = dfs(i, j, [i, j], matrix)
                if value.count == tickets.count + 1 {
                    result = value.map { numToCity($0, dic) }
                    break
                }
            }
        }
    }
    
    return result
}

let tickets = [["ICN", "AAA"], ["ICN", "AAA"], ["ICN", "AAA"], ["AAA", "ICN"], ["AAA", "ICN"]]
print(solution(tickets))
