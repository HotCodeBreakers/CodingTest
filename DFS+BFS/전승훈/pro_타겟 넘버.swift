import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var ans = 0

    func DFS(idx: Int, sum: Int) {
        if idx == numbers.count {
            if sum == target {
                ans += 1
            }
            return
        }
        DFS(idx: idx+1, sum: sum + numbers[idx])
        DFS(idx: idx+1, sum: sum - numbers[idx])
    }

    DFS(idx: 0, sum: 0)

    return ans
}
