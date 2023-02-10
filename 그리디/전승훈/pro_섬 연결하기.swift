import Foundation

//부모의 값을 저장할 변수
var parentArray = [Int]()

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    //각자의 index의 값을 초기값으로 설정해줌
    parentArray = (0..<n).map{$0}
    //cost값에 따라서 정렬을 해준다.
    let sortByCost = costs.sorted{$0[2] < $1[2]}
    //전체 합을 저장할 변수
    var sum = 0
    //정렬해준 다리들을 순환
    for bridge in sortByCost {
        //사이클을 형성하지 않는다면
        if !isCycle(left: bridge[0], right: bridge[1]) {
            //다리를 연결하고
            connectBridge(left: bridge[0], right: bridge[1])
            //전체합에 cost를 더해준다.
            sum += bridge[2]
        }
    }
    //합을 반환
    return sum
}

//연결하는 다리가 사이클을 형성하는지 확인
func isCycle(left:Int,right:Int) -> Bool {
    return parentArray[left] == parentArray[right] ? true : false
}

//다리 연결
func connectBridge(left:Int,right:Int) {
    //oldParent로 right의 가장 부모를 가진 것들을 newParent를 left의 가장 부모로 바꿔준다.
    changeParent(oldParent: findParent(child: right), newParent: findParent(child: left))
}

//가장 위 부모 찾기
func findParent(child:Int) -> Int {
    //parrentArray의 child번째가 child라면 가장 위 부모 아니라면 재귀해줌
    return parentArray[child] == child ? child : findParent(child:parentArray[child])
}

//부모 바꾸기
func changeParent(oldParent:Int,newParent:Int) {
    //oldParent의 값을 가진 index를 찾아내서 해당 index의 값을 newParent로 바꿔준다.
    parentArray.indices.filter {parentArray[$0] == oldParent}.forEach{parentArray[$0] = newParent}
}
