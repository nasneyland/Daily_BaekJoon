let input = Int(readLine()!)!
var num = 1
var index = 0

while true {
    num += (index * 6)
    if input <= num {
        print(index + 1)
        break
    }
    index += 1
}
