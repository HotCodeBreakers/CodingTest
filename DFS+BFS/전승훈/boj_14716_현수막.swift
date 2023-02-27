import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let m = input[0], n = input[1]
let d = [(-1,-1), (-1,1), (1,-1), (1,1), (-1,0), (1,0), (0,-1), (0,1)]

var count = 0
var graph = [[Int]]()

for _ in 0..<m {
    let row = readLine()!.split(separator: " ").map{ Int($0)! }
    graph.append(row)
}

for i in 0..<m {
    for j in 0..<n {
        if graph[i][j] == 1 {
            bfs(y: i, x: j)
            count += 1
        }
    }
}

print(count)

func bfs(y: Int, x: Int) {
    var queue = [(Int, Int)]()
    queue.append((y, x))
    graph[y][x] = 0

    while !queue.isEmpty {
        let point = queue.removeFirst()
        let y = point.0
        let x = point.1

        for (dy, dx) in d {
            let newY = y + dy
            let newX = x + dx
            if (0..<m).contains(newY) && (0..<n).contains(newX) && graph[newY][newX] == 1 {
                queue.append((newY, newX))
                graph[newY][newX] = 0
            }
        }
    }
}

