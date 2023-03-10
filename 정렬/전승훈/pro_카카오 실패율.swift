import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var players = stages.count
    var playersOnStage: [Int : Int] = [:]
    var probabilityOnStage: [Int: Double] = [:]
    var ans: [Int] = []

    // dict 세팅해주기
    for n in 1...N {
        playersOnStage[n] = 0
        probabilityOnStage[n] = 0.0
    }

    // dict 초기값이 세팅되어있다면 카운팅해서 +1
    for stage in stages {
        if playersOnStage[stage] != nil {
            playersOnStage[stage]! += 1
        }
    }

    // 확률 계산해주기
    for i in 1...N {
        if players == 0 {
            probabilityOnStage[i] = 0.0
        } else {
            probabilityOnStage[i] = Double(playersOnStage[i]!) / Double(players)
            players -= playersOnStage[i]!
        }
    }

    print(probabilityOnStage)

    // Sort
    let sortedDict = probabilityOnStage.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }

    for i in sortedDict {
        ans.append(i.key)
    }

    return ans
}
