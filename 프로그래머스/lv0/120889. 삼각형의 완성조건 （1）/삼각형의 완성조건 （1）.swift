import Foundation

func solution(_ sides:[Int]) -> Int {
    return sides.reduce(0,+) - (2 * sides.max()!) > 0 ? 1 : 2
}