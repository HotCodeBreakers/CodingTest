import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]

var space = [[Character]]()
var visit = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
var sheep = 0
var wolf = 0
var dx = [1, -1, 0, 0]
var dy = [0, 0, -1, 1]

for _ in 0..<r {
    let setting = Array(readLine()!)

    for j in 0..<c {
        if setting[j] == "o" { sheep += 1 }
        if setting[j] == "v" { wolf += 1 }
    }
    space.append(setting)
}

for i in 0..<r {
    for j in 0..<c {
        if (space[i][j] == "o" || space[i][j] == "v") && visit[i][j] == 0 {
            visit[i][j] = 1
            bfs(i, j, space: &space, visit: &visit, sheep: &sheep, wolf: &wolf)
        }
    }
}

print("\(sheep) \(wolf)")

func bfs(_ x: Int, _ y: Int, space: inout [[Character]], visit: inout [[Int]], sheep: inout Int, wolf: inout Int) {
    var move = [[x, y]]
    var sameSpaceSheep = 0
    var sameSpaceWolf = 0

    if space[x][y] == "o" { sameSpaceSheep += 1 }
    else if space[x][y] == "v" { sameSpaceWolf += 1 }

    while !move.isEmpty {
        let curr = move.removeFirst()
        let x = curr[0]
        let y = curr[1]

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx >= 0 && nx < space.count && ny >= 0 && ny < space[0].count && visit[nx][ny] == 0 && space[nx][ny] != "#" {
                if space[nx][ny] == "o" { sameSpaceSheep += 1 }
                if space[nx][ny] == "v" { sameSpaceWolf += 1 }
                visit[nx][ny] = 1
                move.append([nx, ny])
            }
        }
    }

    if sameSpaceSheep > 0 && sameSpaceWolf > 0 {
        if sameSpaceSheep > sameSpaceWolf { wolf -= sameSpaceWolf }
        else { sheep -= sameSpaceSheep }
    }
}
