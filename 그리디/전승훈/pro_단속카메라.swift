import Foundation

func solution(routes: [[Int]]) -> Int {
    let sortedRoutes = routes.sorted { $0[1] < $1[1] }
    print(sortedRoutes)
    var camera = -99999
    var count = 0
    
    sortedRoutes.forEach { route in
        if route[0] > camera {
            print("route[0]: \(route[0]) vs camera: \(camera)")
            camera = route[1]
            count += 1
        }
    }
    return count
}
