import Foundation

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var answer = my_string
    
    let index1 = my_string.index(my_string.startIndex, offsetBy: num1)
    let index2 = my_string.index(my_string.startIndex, offsetBy: num2)
    
    let word1 = answer[index1]
    let word2 = answer[index2]
    
    answer.remove(at: index1)
    answer.insert(word2, at: index1)
    answer.remove(at: index2)
    answer.insert(word1, at: index2)
    
    return answer
}