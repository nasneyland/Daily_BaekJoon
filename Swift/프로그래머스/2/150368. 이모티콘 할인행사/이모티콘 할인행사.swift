// 정답코드
func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var result = [0,0]
    
    // 후보로 된 할인율을 순회
    for percents in permutation(emoticons) {
        var plus_cnt = 0
        var imti_price = 0
        
        for user in users {
            var userPrice = 0
            
            for (i, percent) in percents.enumerated() {
                // 유저가 지정한 할인율보다 높다면 임티 구매
                if percent >= user[0] {
                    // ✅고친부분✅
                    userPrice += Int(Double(100 - percent) * Double(emoticons[i]) / 100.0)
                }
            }
            
            // 근데 구매하려는 가격이 플러스 가격보다 높으면 플러스 가입
            if userPrice >= user[1] {
                plus_cnt += 1
            } else {
                imti_price += userPrice
            }
        }
        
        if (result[0] < plus_cnt) || (result[0] == plus_cnt && result[1] < imti_price) {
            result = [plus_cnt, imti_price]
        }
    }
    
    return result
}

func permutation(_ list: [Int]) -> [[Int]] {
    var percentList = [10,20,30,40]
    var result = [[Int]]()
    
    func backtracking(_ ans: inout [Int]) {
        if ans.count == list.count {
            result.append(ans)
            return
        }
        
        for percent in percentList {
            ans.append(percent)
            backtracking(&ans)
            ans.removeLast()
        }
    }
    
    var temp = [Int]()
    backtracking(&temp)
    return result
}