//
//  pro_구명보트.swift
//  AlgorithmStudy
//
//  Created by seojeon22 on 2023/02/10.
//

import Foundation

func solution(_ people: [Int], _ limit: Int ) -> Int {
    var arrPeople = people.sorted()
    var boat: [Int] = [0, 0]
    var count = 0
    
    // arrPeople의 원소 삭제, 0 대입 후 다시 값을 확인하기 위해 for문을 크게 돌림
    for _ in 0... {
        // 배열의 원소가 전부 0이면 break
        if arrPeople.reduce(0, +) == 0 { break }
        
        for i in 0..<arrPeople.count {
            var idx = 0 // 가장 큰 값을 갖게 만든 수가 있던 자리
            var temp = 0 // 가장 큰 값을 갖게 만드는 수를 찾기 위해 비교할 임시값
            
            boat[0] = arrPeople[i]
            arrPeople.removeFirst()
            
            for j in 0..<arrPeople.count {
                if boat[0] + arrPeople[j] >= temp && boat[0] + arrPeople[j] <= limit {
                    temp = boat[0] + arrPeople[j]
                    boat[1] = arrPeople[j]
                    idx = j
                }
            }
            
            // 보트의 두번째 칸에 다른 값이 동승했을 때만 0을 넣어줌. 이렇게 하지 않으면 뒤에 0으로 바꿔준 값들이 엉켜서 오류 발생
            if boat[1] != 0 {
                arrPeople[idx] = 0
            }
            
            boat = [0, 0]
            count += 1
            break
        }
    }
    return count
}
