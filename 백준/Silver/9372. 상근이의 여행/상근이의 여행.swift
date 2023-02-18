let testCase = Int(readLine()!)!
var parents = [Int]()

func findParent(_ node: Int) -> Int {
    if parents[node] == node {
        return node
    } else {
        parents[node] = findParent(parents[node])
    }
    return parents[node]
}

for _ in (0..<testCase) {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var cnt = 0
    
    parents = Array(0...input[0])
    
    for _ in (0..<input[1]) {
        let edges = readLine()!.split(separator: " ").map{Int($0)!}
        let a = findParent(edges[0])
        let b = findParent(edges[1])
        
        if a != b {
            parents[a] = b
            cnt += 1
        }
    }
    print(cnt)
}
