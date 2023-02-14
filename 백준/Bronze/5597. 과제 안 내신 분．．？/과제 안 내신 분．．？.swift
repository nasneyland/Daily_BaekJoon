var inputList = Array(repeating: 0, count: 30)

for _ in 1...28 {
    let input = Int(readLine()!)!
    inputList[input-1] = 1
}

for index in 0..<30 {
    if inputList[index] == 0 {
        print(index+1)
    }
}