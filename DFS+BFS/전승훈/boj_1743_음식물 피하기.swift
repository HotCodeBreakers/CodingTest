import Foundation

let input = readLine()!.split(separator : " " ).map{ Int(String($0))! }
let n = input[0]
let m = input[1]
let k = input[2]
let direction = [[0,1], [1,0], [0,-1], [-1,0]]
var ans = 0
var array = Array(repeating:Array(repeating:0,count : m),count : n )

for _ in 0..<k {
    let xy = readLine()!.split(separator : " " ).map{ Int(String($0))! }
    array[xy[0]-1][xy[1]-1] = 1
}

for i in 0..<n {
    for j in 0..<m {
        if array[i][j] == 1 {
            dfs(i, j)
        }
    }
}

func dfs(_ location1: Int, _ location2: Int) {
    var queue = [[location1, location2]]
    var count = 1
    
    array[location1][location2] = 0
    
    while !queue.isEmpty {
        let now = queue.removeLast()
        
        for i in 0..<4 {
            let next = [now[0] + direction[i][0], now[1] + direction[i][1]]
            
            if next[0] >= n || next[1] >= m || next[0] < 0 || next[1] < 0 { continue }
            
            if array[next[0]][next[1]] == 1 {
                queue.append(next)
                array[next[0]][next[1]] = 0
                count += 1
            }
        }
    }
    ans = max(ans, count)
}

print(ans)
