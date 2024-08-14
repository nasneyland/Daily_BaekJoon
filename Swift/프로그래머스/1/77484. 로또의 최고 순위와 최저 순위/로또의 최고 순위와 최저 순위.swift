import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let my_number = lottos.filter { $0 != 0 }
    let zero_cnt = lottos.count - my_number.count
    
    var win_cnt = 0
    
    for num in win_nums {
        if my_number.contains(num) {
            win_cnt += 1
        }
    }
    
    return [min(6, 7 - (win_cnt + zero_cnt)), min(6, 7 - win_cnt)]
}