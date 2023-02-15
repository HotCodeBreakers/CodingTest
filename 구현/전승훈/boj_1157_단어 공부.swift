
var strUpper = readLine()!.uppercased()
var maxValue = 0

var dict = Dictionary(strUpper.map{($0, 1)},uniquingKeysWith:+)

for z in dict.keys {
    if dict[z] == dict.values.max() {
        maxValue += 1
    }
}

if maxValue > 1 {
    print("?")
} else {
    for x in dict.keys {
        if dict[x] == dict.values.max() {
            print(x)
        }
    }
}
