let input = readLine()!.split(separator: " ").map{Int($0)!}

var visited = Array(repeating: false, count: input[0])
var networks = [[Int]](repeating: [], count: input[0])
var cnt = 0

for _ in 0..<input[1] {
    let inputNetworks = readLine()!.split(separator: " ").map{Int($0)!}
    networks[inputNetworks[0] - 1].append(inputNetworks[1] - 1)
    networks[inputNetworks[1] - 1].append(inputNetworks[0] - 1)
}

func bfs(_ index: Int) {
    visited[index] = true
    
    for i in networks[index] {
        if !visited[i] {
            bfs(i)
        }
    }
}

for d in 0..<input[0] {
    if !visited[d] {
        bfs(d)
        cnt += 1
    }
}

print(cnt)
