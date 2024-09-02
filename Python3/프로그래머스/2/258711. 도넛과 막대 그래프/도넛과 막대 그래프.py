import collections
import sys

def solution(edges):
    sys.setrecursionlimit(10000000)
    graph = collections.defaultdict(list)
    
    # 그래프, 노드수 정의
    nodes = set()
    outdegrees = collections.defaultdict(int)
    indegrees = collections.defaultdict(int)
    for edge in edges:
        graph[edge[0]].append(edge[1])
        nodes.add(edge[0])
        nodes.add(edge[1])
        outdegrees[edge[0]] += 1 # ✅고친부분✅
        indegrees[edge[1]] += 1 # ✅고친부분✅
        
    # 시작노드 찾기 ✅고친부분✅
    start_node = 0
    for node in nodes:
        if node not in indegrees and outdegrees[node] >= 2:
            start_node = node
            break
        
    print(start_node)
      
    # DFS 함수
    def dfs(start, cur, visited):
        # print(cur)
        if len(graph[cur]) == 2:
            # print("팔자")
            return 3
        if len(graph[cur]) == 0:
            # print("막대")
            return 2
        for next in graph[cur]:
            if next not in visited:
                visited.add(next)
                return dfs(start, next, visited)
        return 1
    
    # 시작지점에서부터 노드들 순회 돌기
    result = [start_node, 0, 0, 0]
    for cur in graph[start_node]:
        # print("----------cur-------------")
        idx = dfs(cur, cur, set())
        if idx != None:
            result[idx] += 1
        
    return result