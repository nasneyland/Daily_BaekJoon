import Foundation

let inputCnt = Int(readLine()!)!
    var inputList = [[Int]]()
    
    for _ in (0..<inputCnt) {
        inputList.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    
    inputList.forEach { input in
        print(String(((input[2] - 1) % input[0]) + 1) + String(format: "%02d", ((input[2] - 1) / input[0]) + 1))
    }