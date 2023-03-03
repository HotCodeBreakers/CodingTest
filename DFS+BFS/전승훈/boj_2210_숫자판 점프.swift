var arr = [[Int]]()

for _ in 0..<5 {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(t)
}

let direction = [[1, 0], [0, 1], [-1, 0], [0, -1]]

var ans = Set<Int>()

for i in 0..<5 {
    for j in 0..<5 {
        dfs(i, j, 0, arr[i][j])
    }
}

print(ans.count)

func dfs(_ X: Int, _ Y: Int, _ moved: Int, _ pointValue: Int) {
    if moved == 5 {
        ans.insert(pointValue)
        return
    }
    
    for i in 0..<4 {
        let movedX = X + direction[i][0]
        let movedY = Y + direction[i][1]
        
        if movedX < 5 && movedY < 5 && movedX >= 0 && movedY >= 0 {
            dfs(movedX, movedY,  moved + 1, pointValue * 10 + arr[movedX][movedY])
        }
    }
}
