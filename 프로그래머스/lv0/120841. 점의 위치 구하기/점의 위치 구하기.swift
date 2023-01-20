import Foundation

func solution(_ dot:[Int]) -> Int {
    return dot.first! > 0 ? (dot.last! > 0 ? 1 : 4) : (dot.last! > 0 ? 2 : 3)
}