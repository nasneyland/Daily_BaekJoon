let input = Int(readLine()!)!
var result = 0

for i in (1..<input) {
    if (String(i).map{Int(String($0))!}.reduce(0,+) + i == input) {
        result = i
        break
    }
}
print(result)