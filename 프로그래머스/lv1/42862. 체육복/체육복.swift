import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var array = Array(repeating: 1, count: n)
    lost.forEach { array[$0-1] -= 1 }
    reserve.forEach { array[$0-1] += 1 }
    (0...n-1).forEach { 
        if $0 != 0 && array[$0] == 0 && array[$0-1] == 2 {
            // 앞사람 확인
            array[$0] = 1
            array[$0-1] = 1
        } else if $0 != (n-1) && array[$0] == 0 && array[$0+1] == 2 {
            // 뒷사람 확인
            array[$0] = 1
            array[$0+1] = 1
        }
    }
    return array.filter{$0>0}.count
}
