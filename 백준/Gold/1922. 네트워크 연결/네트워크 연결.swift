let nodeCnt = Int(readLine()!)!
let edgeCnt = Int(readLine()!)!

var parents = Array(0...nodeCnt)
var edgeList = [[Int]]()
var cost = 0

// 간선들 입력받기
for _ in (0..<edgeCnt) {
    edgeList.append(readLine()!.split(separator: " ").map{Int($0)!})
}

// 최상위 부모 찾기
func findParent(_ node: Int) -> Int {
    if parents[node] != node {
        parents[node] = findParent(parents[node])
    }
    return parents[node]
}

edgeList.sorted{$0[2] < $1[2]}.forEach {
    let (a,b,dist) = (findParent($0[0]),findParent($0[1]),$0[2])
    
    if a != b {
        parents[a] = b
        cost += dist
    }
}

print(cost)