import Foundation

func solution(_ n:Int) -> Int {
//    return (2..<n).filter { $0 * $0 == n }.count >= 1 ? 1 : 2
    
    return sqrt(Double(n)) == floor(sqrt(Double(n))) ? 1 : 2
}