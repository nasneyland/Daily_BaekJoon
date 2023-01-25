import Foundation

func solution(_ n:Int) -> Int {
    return floor(sqrt(Double(n))) == sqrt(Double(n)) ? 1 : 2
}