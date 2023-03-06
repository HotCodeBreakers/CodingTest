//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/01.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    /*
     재귀의 return을 사용하지 않은 코드
    func dfs(_ i: Int, _ visit: [Bool], _ deep: Int, _ arr: inout [Int]) {
        var visited = visit
        var depth = deep
        
        visited[i] = true
        depth += 1
        
        if words[i] == target {
            arr.append(depth)
        }
        
        for k in words.indices {
            if visited[k] == true || !oneCharDiff(words[i], words[k]) { continue }
            dfs(k, visited, depth, &arr)
        }
    }
     */
    
    func dfs(_ i: Int, _ visit: [Bool], _ deep: Int) -> Int {
        var visited = visit
        var depth = deep
        var minValue = 55
        
        visited[i] = true
        depth += 1
        
        if words[i] == target {
            return depth
        }
        
        for k in words.indices {
            if visited[k] == true || !oneCharDiff(words[i], words[k]) { continue }
            let value = dfs(k, visited, depth)
            // 초기에 아래 코드를 넣어주지 않아서 의미 있는 재귀의 return 값을 만들어내지 못했었음
            minValue = min(value, minValue)
        }
        
        return minValue
    }

    
    func oneCharDiff(_ str1: String, _ str2: String) -> Bool {
        var cnt = 0
        for i in str1.indices {
            if cnt >= 2 {
                return false
            }
            if str1[i] != str2[i] {
                cnt += 1
            }
        }
        return cnt == 1 ? true : false
    }
    
    let visited = Array(repeating: false, count: words.count)
    if !words.contains(target) { return 0 }
    var minCnt = 55
    for i in words.indices {
        var results: [Int] = [55]
        if oneCharDiff(begin, words[i]) {
            let minResult = dfs(i, visited, 0)
            minCnt = min(minCnt, minResult)
        }
    }
    
    return minCnt
}
let begin = "hit"
let target = "cog"
let words = ["hot", "dot", "dog", "lot", "log", "cog"]
print(solution(begin, target, words))
