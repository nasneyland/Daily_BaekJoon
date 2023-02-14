let _ = readLine()!
let inputList = readLine()!.split(separator: " ").map{Int($0)!}
let number = Int(readLine()!)!

print(inputList.filter {$0 == number}.count)