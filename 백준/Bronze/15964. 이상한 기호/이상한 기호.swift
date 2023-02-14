let inputList = readLine()!.split(separator: " ").map{Int($0)!}
let a = inputList[0]
let b = inputList[1]

print((a+b)*(a-b))