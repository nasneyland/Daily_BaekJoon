import Foundation

func solution(_ s:String) -> Int {
    var stack: [Int] = []
    s.split(separator: " ").forEach {
        if String($0) == "Z" {
            stack.removeLast()
        } else {
            stack.append(Int($0)!)
        }
    }
    return stack.reduce(0,+)
}
