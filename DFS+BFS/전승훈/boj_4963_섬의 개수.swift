
import Foundation

while true {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let w = input[0]
    let h = input[1]
    let direction = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]

    var graph = [[Int]]()
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: w), count: h)
    var count = 0
    
    if input == [0, 0] {
        break
    } else {
        for _ in 0..<h {
            let landSea = readLine()!.split(separator: " ").map{ Int($0)! }
            graph.append(landSea)
        }
        
        for i in 0..<h {
            for j in 0..<w {
                if graph[i][j] == 1 && visited[i][j] == 0 {
                    visited[i][j] = 1
                    bfs(j,i)
                    count += 1
                }
            }
        }
        
        print(count)
        
        func bfs(_ x: Int, _ y: Int) {
            for i in 0..<8 {
                let nx = x + direction[i].0
                let ny = y + direction[i].1
                
                if nx < 0 || nx > w-1 || ny < 0 || ny > h-1 {
                    continue
                } else {
                    if visited[ny][nx] == 0 && graph[ny][nx] == 1 {
                        visited[ny][nx] = 1
                        bfs(nx,ny)
                    }
                }
            }
        }
    }
}

