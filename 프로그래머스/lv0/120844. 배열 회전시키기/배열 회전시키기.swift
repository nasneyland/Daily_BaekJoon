import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var answer = numbers
    
    if direction == "right" {
        answer[0] = numbers[numbers.endIndex - 1]
        (1...(answer.count-1)).forEach { answer[$0] = numbers[$0-1] }
    } else {
        answer[answer.endIndex - 1] = numbers[0]
        (0...(answer.count-2)).forEach { answer[$0] = numbers[$0+1] }
    }
    return answer
}