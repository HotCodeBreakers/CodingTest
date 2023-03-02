import Foundation
// 35분

let input = readLine()!.split(separator : " " ).map{Int(String($0))!}

let row = input[0], col = input[1]
var array = Array(repeating : [String]() , count : row )
var target = (0,0)
var start = (0,0)
var waters = [(Int,Int)]()
let direction = [(0,1),(1,0),(0,-1),(-1,0)]
var check = Array(repeating: Array(repeating: false, count: col), count: row)
for i in 0..<row {
    let input2 = readLine()!.map{String($0)}
    for j in 0..<col {
        if input2[j] == "D" {
            target = (i,j)
        }else if input2[j] == "S" {
            start = (i,j)
        }else if input2[j] == "*" {
            waters.append((i,j))
        }
    }
    array[i] = input2
}
check[start.0][start.1] = true


//물동시키기
func flows() {
    var temp = [(Int,Int)]()
    for water in waters {
        for i in 0..<4 {
            let next = (water.0 + direction[i].0 , water.1 + direction[i].1)
            if next.0 >= row || next.1 >= col || next.0 < 0 || next.1 < 0 { continue }
            if array[next.0][next.1] == "." {
                array[next.0][next.1] = "*"
                temp.append((next.0,next.1))
            }
        }
    }
    waters = temp
}

func bfs() {
    var queue = [(Int,Int,Int)]()
    var success = false
    var count = -1
    queue.append((start.0,start.1,0))
    
    while queue.isEmpty == false {
        let first = queue.removeFirst()
        
        if (first.0,first.1) == target {
            print(first.2)
            success = true
            break
        }
        
        if first.2 != count {
            count = first.2
            flows()
        }
        
        for i in 0..<4 {
            let next = (first.0 + direction[i].0 , first.1 + direction[i].1)
            if next.0 >= row || next.1 >= col || next.0 < 0 || next.1 < 0 { continue }
            if (array[next.0][next.1] == "." || array[next.0][next.1] == "D") && check[next.0][next.1] == false {
                check[next.0][next.1] = true
                queue.append((next.0,next.1,first.2 + 1 ))
                
            }
        }
    }
    if success == false {
        print("KAKTUS")
    }
    
}

bfs()

// 출처: https://m.blog.naver.com/gustn3964/222119972932
