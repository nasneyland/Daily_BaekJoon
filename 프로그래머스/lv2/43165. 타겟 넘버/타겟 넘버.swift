import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var cnt = 0
    
    func DFS(index: Int, sum: Int) {
        if index == numbers.count {
            if sum == target { cnt += 1 }
            return
        } else {
            DFS(index: index + 1, sum: sum + numbers[index])
            DFS(index: index + 1, sum: sum - numbers[index])
        }
    }
    
    DFS(index:0, sum:0)
    
    return cnt
}
