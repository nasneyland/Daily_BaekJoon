import Foundation

func solution(_ dot:[Int]) -> Int {
    return dot[0] < 0 ? (dot[1] < 0 ? 3 : 2) : (dot[1] < 0 ? 4 : 1)
}