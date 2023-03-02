let HW = readLine()!.split(separator: " ").map { Int(String($0))! }
let blocks = readLine()!.split(separator: " ").map { Int(String($0))! }
var ans = 0

for i in 1..<blocks.count-1 {
    let leftHeight = blocks[...i].max()!
    let rightHeight = blocks[(i+1)...].max()!
    let compare = min(leftHeight, rightHeight)
    if blocks[i] < compare {
        ans += compare - blocks[i]
    }
}

print(ans)
