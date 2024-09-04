import Foundation

func solution(_ expression:String) -> Int64 {
    
    // 수식의 우선순위 경우의 수 구하기
    let cases = permutation(list: ["-","+","*"])
    
    // 표현식 리스트로 자르기
    var exp_list = [String]()
    var temp_list = ""
    for exp in expression {
        if ["+", "-", "*"].contains(exp) {
            exp_list.append(temp_list)
            exp_list.append(String(exp))
            temp_list = ""
        } else {
            temp_list += String(exp)
        }
    }
    exp_list.append(temp_list)
    
    // 수식 우선순위에 따라 각각의 표현식 계산하기
    var result = [Int]()
    for c in cases {
        var total_exp = Array(exp_list.reversed())
        var stack = [String]()
        for exp in c {
            while total_exp.count != 0 {
                let temp = total_exp.popLast()!
                if temp == exp {
                    var before = stack.popLast()!
                    var after = total_exp.popLast()!
                    var ans = 0
                    
                    if exp == "-" {
                        ans = Int(before)! - Int(after)!
                    } else if exp == "*" {
                        ans = Int(before)! * Int(after)!
                    } else if exp == "+" {
                        ans = Int(before)! + Int(after)!
                    }
                    stack.append(String(ans))
                } else {
                    stack.append(temp)
                }
            }
            total_exp = Array(stack.reversed())
            stack = []
        }
        
        var result_num = Int(total_exp[0])!
        if result_num < 0 {
            result_num *= -1
        }
        result.append(result_num)
    }
    
    return Int64(result.max()!)
}

// 순열코드
func permutation(list: [String]) -> [[String]] {
    var result = [[String]]()
    
    func backtracking(_ ans: inout [String], _ visited: inout [Bool]) {
        if ans.count == list.count {
            result.append(ans)
            return
        }
        
        for (i, l) in list.enumerated() {
            if !visited[i] {
                ans.append(l)
                visited[i] = true
                backtracking(&ans, &visited)
                ans.removeLast()
                visited[i] = false
            }
        }
    }
    
    var ans = [String]()
    var visited = Array(repeating: false, count: list.count)
    backtracking(&ans, &visited)
    return result
}