import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited = Array(repeating: false, count: n)
    var cnt = 0
    
    func bfs(_ index: Int) {
        visited[index] = true
        
        for (i, computer) in computers[index].enumerated() {
            if !visited[i] && computer == 1 {
                bfs(i)
            }
        }
    }
    
    (0..<n).forEach { index in
        if !visited[index] {
            bfs(index)
            cnt += 1
        }
    }
    return cnt
}
