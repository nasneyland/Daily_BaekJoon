import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited: [Bool] = Array(repeating: false, count: n)
    var network: Int = 0
 
    func bfs(_ computer: Int) {
        visited[computer] = true
        
        for i in 0..<n {
            if computers[computer][i] == 1 && visited[i] == false {
                bfs(i)
            }
        }
    }
 
    for i in 0..<n {
        if !visited[i] {
            network += 1
            bfs(i)
        }
    }
 
    return network
}
