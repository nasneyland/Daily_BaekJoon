import Foundation

func solution(_ quiz:[String]) -> [String] {
    return quiz.map { str-> String in
        var q = str.split(separator: " ")
        if q[1] == "+" {
            return Int(q[0])! + Int(q[2])! == Int(q[4])! ? "O" : "X"
        } else {
            return Int(q[0])! - Int(q[2])! == Int(q[4])! ? "O" : "X"
        }
    }
}