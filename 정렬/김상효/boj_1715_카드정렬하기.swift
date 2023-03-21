//
//  main.swift
//  Algorithm
//
//  Created by sanghyo on 2023/03/19.
//


import Foundation

let n = Int(readLine()!)!
var cards: [Int] = []
for _ in 0..<n { cards.append(Int(readLine()!)!) }

cards.sort()

var heap = Heap.init(data: cards[0])
for i in 1..<cards.count {
    heap.insert(data: cards[i])
}

var res = 0

while heap.heap.count > 2 {
    let value = heap.pop()! + heap.pop()!
    heap.insert(data: value)
    res += value
}

print(res)

struct Heap {
    enum moveDownStatus { case none, left, right }
    
    var heap: [Int] = [Int.max]
    
    init() { }
    init(data: Int) {
        heap.append(data)
    }
    
    mutating func insert(data: Int) {
        var currentIdx = heap.count - 1
        
        heap.append(data)
        
        func isMoveUp(_ insertIdx: Int) -> Bool {
            if insertIdx == 1 { return false }
            let parentIdx = insertIdx / 2
            return heap[parentIdx] > heap[insertIdx] ? true : false
        }
        
        while isMoveUp(currentIdx) {
            let parentIdx = currentIdx / 2
            heap.swapAt(parentIdx, currentIdx)
            currentIdx = parentIdx
        }
    }
    
    mutating func pop() -> Int? {
        if heap.count == 1 { return nil }
        else if heap.count == 2 { return heap.removeLast() }
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func isMoveDown(_ poppedIdx: Int) -> moveDownStatus {
            let childLeftIdx = poppedIdx * 2
            let childRightIdx = childLeftIdx + 1
            
            if childLeftIdx >= heap.count {
                return .none
            }
            if childRightIdx >= heap.count {
                return heap[childLeftIdx] < heap[poppedIdx] ? .left : .none
            }
            
            if (heap[childLeftIdx] > heap[poppedIdx]) && (heap[childRightIdx] > heap[poppedIdx]) {
                return .none
            }
            
            if (heap[childLeftIdx] < heap[poppedIdx]) && (heap[childRightIdx] < heap[poppedIdx]) {
                return heap[childLeftIdx] < heap[childRightIdx] ? .left : .right
            }
            
            return heap[childLeftIdx] < heap[childRightIdx] ? .left : .right
        }
        
        var idx = 1
        while true {
            switch isMoveDown(idx) {
            case .none:
                return returnData
            case .left:
                let childLeftIdx = idx * 2
                heap.swapAt(childLeftIdx, idx)
                idx = childLeftIdx
            case .right:
                let childRightIdx = idx * 2 + 1
                heap.swapAt(childRightIdx, idx)
                idx = childRightIdx
            }
        }
    }
}
