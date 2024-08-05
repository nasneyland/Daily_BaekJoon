import Foundation

func solution(_ s:String) -> Bool {
    var stack: [Character] = []
    
    for char in s {
        if char == "(" {
            stack.append(char)
        } else {
            if stack.isEmpty {
                return false
            } else {
                var last = stack.popLast()
                if last != "(" {
                    return false
                }
            }
        }
        
    }
    return stack.isEmpty
}