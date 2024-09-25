import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Set<Int>()
    
    func bfs(_ i: Int) {
        var queue = [Int]()
        queue.append(i)
        
        while !queue.isEmpty {
            var temp = queue.removeFirst()
            
            for (i, computer) in computers[temp].enumerated() {
                if (computer == 1 && !visited.contains(i)) {
                    visited.insert(i)
                    queue.append(i)
                }
            }
        }
    }
    
    var cnt = 0
    for i in 0..<n {
        if (!visited.contains(i)) {
            visited.insert(i)
            cnt += 1
            bfs(i)
        }
    }
    return cnt
}