import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var square = [0, 0]
    sizes.forEach {
        let size = $0.sorted(by: >)
        square[0] = max(square[0], size[0])
        square[1] = max(square[1], size[1])
    }
    return square[0] * square[1]
}