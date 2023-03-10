import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var ans = -1
    
    for i in 0..<citations.count {
        let value = citations[i]
        let h = i+1

        if h > value {
            ans = i
            break
        }
    }

    if ans == -1 {
        return citations.count
    }

    return ans
}
