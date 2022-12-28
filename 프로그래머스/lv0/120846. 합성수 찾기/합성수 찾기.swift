import Foundation

func solution(_ n:Int) -> Int {
    var cnt = 0
    
    for i in (1...n) {
        if ((1...n).filter { i % $0 == 0 }.count > 2) {cnt += 1}
    }
    
    return cnt
}