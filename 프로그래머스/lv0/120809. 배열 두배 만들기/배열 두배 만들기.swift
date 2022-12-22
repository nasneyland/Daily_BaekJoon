import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer: [Int] = []
    
    for i in numbers {
        answer.append(i * 2)
    }
    
    return answer
}