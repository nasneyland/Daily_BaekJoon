import Foundation

func solution(_ s:String) -> Int{
    
    var stack: [String] = []
    
    for chr in s {
        stack.append(String(chr))
        
        // 스택 공통요소 있나 확인
        while true {
            let stack_cnt = stack.count
            if stack_cnt < 2 {
                break
            }
            
            if stack[stack_cnt - 1] == stack[stack_cnt - 2] {
                stack.removeLast(2)
            } else {
                break
            }
        }
    }

    return stack.isEmpty ? 1 : 0
}