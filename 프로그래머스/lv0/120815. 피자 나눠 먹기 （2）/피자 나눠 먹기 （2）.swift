import Foundation

func solution(_ n:Int) -> Int {
    return (1...n).filter{ (6 * $0) % n == 0 }[0]
}