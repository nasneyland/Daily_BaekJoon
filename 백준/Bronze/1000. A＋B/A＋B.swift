import Foundation

let input = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
print(input.reduce(0,+))