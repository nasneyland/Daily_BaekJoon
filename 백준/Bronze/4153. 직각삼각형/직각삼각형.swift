import Foundation

var inputList = [[Double]]()
while true {
    let input = readLine()!.split(separator: " ").map{Double($0)!}.sorted(by: >)
    if input == [0,0,0] {
        break
    } else {
        inputList.append(input)
    }
}
inputList.forEach { input in
                   print(pow(input[0],2) == pow(input[1],2)+pow(input[2],2) ? "right" : "wrong")
                  }