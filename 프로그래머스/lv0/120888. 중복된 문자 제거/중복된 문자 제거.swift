import Foundation

func solution(_ my_string:String) -> String {
    var answer = ""
    for s in my_string {
        if !answer.contains(s) {
            answer += String(s)
        }
    }
    return answer
}