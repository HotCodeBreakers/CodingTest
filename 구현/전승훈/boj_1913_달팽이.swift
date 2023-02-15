
let n = Int(readLine()!)!
let target = Int(readLine()!)!
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var squareN: Int = n * n
var x: Int = -1
var y: Int = 0
var targetPoint: [Int] = []

while squareN > 0 {
    while x < n - 1 && array[x + 1][y] == 0 {
        x += 1
        array[x][y] = squareN
        squareN -= 1
        if array[x][y] == target {
            targetPoint = [x + 1, y + 1]
        }
    }
    
    while y < n - 1 && array[x][y + 1] == 0 {
        y += 1
        array[x][y] = squareN
        squareN -= 1
        if array[x][y] == target {
            targetPoint = [x + 1, y + 1]
        }
    }
    
    while x > 0 && array[x - 1][y] == 0 {
        x -= 1
        array[x][y] = squareN
        squareN -= 1
        if array[x][y] == target {
            targetPoint = [x + 1, y + 1]
        }
    }
    
    while y > 0 && array[x][y - 1] == 0 {
        y -= 1
        array[x][y] = squareN
        squareN -= 1
        if array[x][y] == target {
            targetPoint = [x + 1, y + 1]
        }
    }
}

for i in array {
    for j in i {
        print(j, terminator: " ")
    }
    print("")
}

print("\(targetPoint[0]) \(targetPoint[1])")
