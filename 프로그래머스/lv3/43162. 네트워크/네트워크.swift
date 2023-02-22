import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var connected = Array(repeating: false, count: n)
    var cnt = 0
    
    func bfs(_ index: Int) {
        if connected[index] { return }
        connected[index] = true
        
        for (i,c) in computers[index].enumerated() {
            if c == 1 {
                bfs(i)
            }
        }
    }
    
    for i in (0..<computers.count) {
        if !connected[i] {
            cnt += 1
            bfs(i)
        }
    }
    
    return cnt
}