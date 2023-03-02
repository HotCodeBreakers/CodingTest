
// 스위치 개수, 초기 스위치 상태 세팅
let bulbs = Int(readLine()!)!
var switchButton = Array(readLine()!.split(separator: " ").map{ Int($0)! })

// 사람 수, 명령 세팅
let studentsCount = Int(readLine()!)!

for _ in 0..<studentsCount {
    let student = readLine()!.split(separator: " ").map{ Int($0)! }
    
    // 학생이 남자인 경우
    if student[0] == 1 {
        for i in stride(from: student[1]-1, to: bulbs, by: student[1]) {
            if switchButton[i] == 1 {
                switchButton[i] = 0
            } else {
                switchButton[i] = 1
            }
        }
        // 학생이 여자인 경우
    } else {
        for j in 0..<student[1] {
            if student[1] + j <= bulbs {
                let left = switchButton[(student[1]-1) + j]
                let right = switchButton[(student[1]-1) - j]
                
                if left == right {
                    if switchButton[(student[1]-1) + j] == 1 {
                        switchButton[(student[1]-1) + j] = 0
                        switchButton[(student[1]-1) - j] = 0
                    } else {
                        switchButton[(student[1]-1) + j] = 1
                        switchButton[(student[1]-1) - j] = 1
                    }
                } else {
                    break
                }
            }
        }
    }
}

for i in 0...(bulbs/20) {
    let start = 20 * i
    let end = 20 * (i + 1) - 1
    
    if i != bulbs/20 {
        print(switchButton[start...end].map{ String($0) }.joined(separator: " "))
    } else {
        print(switchButton[start...].map{ String($0) }.joined(separator: " "))
    }
}
