import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0

    func DFS(index: Int, sum: Int) {
        if index == (numbers.count) && sum == target {
            count += 1
            return
        }

        guard index < numbers.count else { return }

        DFS(index: index + 1, sum: sum + numbers[index])
        DFS(index: index + 1, sum: sum - numbers[index])
    }

    DFS(index: 0, sum: 0)

    return count
}
