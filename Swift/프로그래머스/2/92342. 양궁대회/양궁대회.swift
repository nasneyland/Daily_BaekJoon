import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var result = [[Int]]()
    var max_num = 0
    
    func backtracking(_ i: Int, _ lionCnt: Int, _ apeachScore: Int, _ lionScore: Int, _ ans: [Int]) {
//        print(i, lionCnt, apeachScore, lionScore)
        if i < 0 {
            let diff = lionScore - apeachScore
            if diff > 0 {
                if diff > max_num {
                    max_num = diff
                    result = [ans]
                } else if diff == max_num {
                    result.append(ans)
                }
            }
            return
        }
        
        // 라이언이 이기는 경우 (이기려면 어피치보다 하나 더 많이 쏘자)
        let lion = i == 0 ? n - lionCnt : info[10 - i] + 1
        if lionCnt + lion <= n {
            var temp = ans
            temp.append(lion)
            backtracking(i-1, lionCnt + lion, apeachScore, lionScore + i, temp)
            temp.popLast()
        }
        
        // 어피치가 이기는 경우 (라이언은 0만 쏴야됨 -> 화살 낭비 금지)
        let apeach = info[10-i] != 0 ? apeachScore + i : apeachScore
        var temp = ans
        temp.append(0)
        backtracking(i-1, lionCnt, apeach, lionScore, temp)
        temp.popLast()
    }
    
    backtracking(10, 0, 0, 0, [])
    
    // 결과가 여러개인 경우 정렬해주기
    for i in 0...10 {
        result.sort{$0[i] > $1[i]}
    }
    
    if result.isEmpty {
        return [-1]
    } else {
        return result[0]
    }
}