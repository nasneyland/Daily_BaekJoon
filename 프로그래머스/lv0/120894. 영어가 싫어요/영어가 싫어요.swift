import Foundation

func solution(_ numbers:String) -> Int64 {
    var engDic = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    var answer = numbers
    
    engDic.forEach {
        answer = answer.replacingOccurrences(of: $0.0, with: $0.1)
    }
    return Int64(answer)!
}