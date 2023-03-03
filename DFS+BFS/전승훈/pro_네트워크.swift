import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var count = 0
 
    func dfs(_ next: Int) {
        visited[next] = true
        
        for i in 0..<n {
            if computers[next][i] == 1 && visited[i] == false {
                dfs(i)
            }
        }
    }
 
    for i in 0..<n {
        if !visited[i] {
            count += 1
            dfs(i)
        }
    }
    return count
}
