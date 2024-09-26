import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    
    // 노드간 관계성 정리
    var graph = [Int:[Int]]()
    var nodes = Set<Int>()
    var indegree = Set<Int>()
    var outdegree = [Int: Int]()
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
        nodes.insert(edge[0])
        nodes.insert(edge[1])
        indegree.insert(edge[1])
        outdegree[edge[0], default: 0] += 1
    }
    
    // 시작 노드 찾기
    var start = 0
    for node in nodes {
        if !indegree.contains(node) && outdegree[node]! >= 2 {
            start = node
        }
    }
    
    var result = [start,0,0,0]
    
    // 노드 순회하기
    for node in graph[start]! {
        var queue = [Int]()
        var visited = Set<Int>()
        queue.append(node)
        
        // flag 1: 도넛, 2: 막대, 3: 8자
        var flag = 2
        
        while !queue.isEmpty {
            var temp = queue.removeFirst()
            guard let next = graph[temp] else { break }
            
            // 8자인경우
            if next.count == 2 {
                flag = 3
                break
            }
            
            if visited.contains(next[0]) {
                flag = 1
                break
            }
            
            if next.count != 0 {
                queue.append(next[0])
                visited.insert(next[0])
            }
        }
        
        result[flag] += 1
    }
    
    return result
}