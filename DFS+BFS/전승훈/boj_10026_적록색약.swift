import Foundation

let n = Int(readLine()!)!
var graph = [[String]]()
var visited = [[Bool]]()
var count = [0, 0]

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

for _ in 0..<n {
    graph.append(readLine()!.map{ String($0) })
    visited.append(Array(repeating: false, count: n))
}

// 적록색약이 아닌 경우
for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] {
            bfs(i, j, colorWeak: false)
            count[0] += 1
        }
    }
}

// 초기화
visited = Array(repeating: Array(repeating: false, count: n), count: n)

// 적록색약의 경우
for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] {
            bfs(i, j, colorWeak: true)
            count[1] += 1
        }
    }
}

print("\(count[0]) \(count[1])")

func bfs(_ x: Int, _ y: Int, colorWeak: Bool) {
    var queue = [[x, y]]
    let color = graph[x][y]
    visited[x][y] = true

    while !queue.isEmpty {
        let current = queue.removeFirst()
        for i in 0..<4 {
            let nx = current[0] + dx[i]
            let ny = current[1] + dy[i]

            if 0..<n ~= nx && 0..<n ~= ny && !visited[nx][ny] {
                if colorWeak && (color == "R" || color == "G") && (graph[nx][ny] == "R" || graph[nx][ny] == "G") {
                    queue.append([nx, ny])
                    visited[nx][ny] = true
                }
                else if graph[nx][ny] == color {
                    queue.append([nx, ny])
                    visited[nx][ny] = true
                }
            }
        }
    }
}
