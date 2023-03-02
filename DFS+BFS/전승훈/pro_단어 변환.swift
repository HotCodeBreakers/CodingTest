func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visit = Array(repeating: false, count : words.count)
    var answer = 51

    func dfs(_ nextWord: String, _ count: Int) {
        if nextWord == target {
            answer = min(answer, count)
            return
        }
        
        for i in 0..<words.count {
            if visit[i] == false && zip(nextWord, words[i]).filter({$0 != $1}).count == 1  {
                visit[i] = true
                dfs(words[i], count+1)
                visit[i] = false
            }
        }
    }
    
    dfs(begin, 0)
    return answer == 51 ? 0 : answer
}
