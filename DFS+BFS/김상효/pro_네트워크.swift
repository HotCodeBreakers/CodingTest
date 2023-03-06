//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/02/28.
//


 // BFS
 
 func solution(_ n:Int, _ computers:[[Int]]) -> Int {
     var visited: [Bool] = Array(repeating: false, count: n)
     var cnt = 0
     
     func bfs(_ idx: Int) {
         var queue: [Int] = [idx]
         var head = 0
         visited[idx] = true
         
         while head < queue.count {
             let node = queue[head]
             
             for i in 0..<n {
                 if i == node || computers[node][i] == 0 || visited[i] { continue }
                 visited[i] = true
                 queue.append(i)
             }
             head += 1
         }
     }
     
     for i in 0..<n {
         if !visited[i] {
             bfs(i)
             cnt += 1
         }
     }
     
     return cnt
 }
 




/*
 // DFS
 
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var cnt = 0
    
    for i in 0..<n {
        if !visited[i] {
            dfs(i, &visited, computers)
            cnt += 1
        }
    }
    return cnt
}

func dfs(_ idx: Int, _ visited: inout [Bool], _ computers: [[Int]]) {
    visited[idx] = true
    
    for i in 0..<computers.count {
        if i == idx || visited[i] == true || computers[idx][i] == 0 { continue }
        dfs(i, &visited, computers)
    }
}
*/
