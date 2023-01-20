import Foundation

func solution(_ n:Int) -> Int {
    return (1...n).filter { number in
       var cnt = 0
        (1...number).forEach {
            if number % $0 == 0 {
                cnt += 1
            }
        }
       return cnt > 2
    }.count
}