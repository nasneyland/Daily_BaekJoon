import Foundation

func solution(_ word:String) -> Int {
    
    let str_list = ["A", "E", "I", "O", "U"]
    var cnt = 0
    
    func backtracking(_ ans: [String]) -> Bool {
        
        cnt += 1
        
        if ans.joined() == word {
            return true
        }
        
        if ans.count == 5 {
            return false
        }
        
        var temp = ans
        for str in str_list {
            temp.append(str)
            if backtracking(temp) {
                return true
            }
            temp.popLast()
        }
        
        return false
    }
    
    for str in str_list {
        if backtracking([str]) {
            return cnt
        }
    }
        
    return 0
}