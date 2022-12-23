import Foundation

func solution(_ slice:Int, _ n:Int) -> Int {
    return (1...n).filter { (slice * $0) / n > 0 }[0]
}