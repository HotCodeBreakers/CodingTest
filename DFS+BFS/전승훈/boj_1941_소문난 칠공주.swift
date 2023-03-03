var arr: [String] = []

for _ in 0..<5 {
    arr.append(readLine()!)
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
var ans = 0
var p: [Int] = []

func check(_ s: Int) {
    let x = s % 5
    let y = s / 5
    
    for i in 0..<4 {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX >= 0 && newX < 5 && newY >= 0 && newY < 5 {
            if visited[newY][newX] == 0 {
                if p.contains(newY * 5 + newX) {
                    visited[newY][newX] = 1
                    check(newY * 5 + newX)
                }
            }
        }
    }
}

func dfs(_ count: Int, _ idx: Int, _ countY: Int) {
    if countY >= 4 || 25 - idx < 7 - count {
        return
    }
    
    if count == 7 {
        check(p[0])
        if visited.flatMap({$0}).reduce(0, +) == 7 {
            ans += 1
        }
        visited = Array(repeating: Array(repeating: 0, count: 5), count: 5)
        return
    }
    
    let x = idx % 5
    let y = idx / 5
    
    p.append(idx)
    
    if arr[y][arr[y].index(arr[y].startIndex, offsetBy: x)] == "Y" {
        dfs(count+1, idx+1, countY+1)
    } else {
        dfs(count+1, idx+1, countY)
    }
    
    p.removeLast()
    
    dfs(count, idx+1, countY)
}

dfs(0, 0, 0)
print(ans)
