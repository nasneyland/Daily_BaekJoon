import Foundation

func solution(_ s:String) -> Int {
    let dict: [String: Int] = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9,
    ]
    
    var stack: [String] = []
    var result = ""
    
    for chr in s {
        if let num = Int(String(chr)) {
            result += String(chr)
        } else {
            stack.append(String(chr))
            
            if let num = dict[stack.joined()] {
                result += String(num)
                stack = []
            } 
        }
    }
    return Int(result)!
}