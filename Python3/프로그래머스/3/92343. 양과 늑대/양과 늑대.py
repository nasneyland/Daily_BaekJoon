import collections

def solution(info, edges):
    len_node = len(info)
    max_cnt = 0
    
    # 그래프 생성
    graph = collections.defaultdict(list)
    for p,c in edges:
        graph[p].append(c)
        
    # print(graph)
        
    visited = []
    def backtracking(sheep, wolf,depth):
        # print(depth, sheep, wolf)
        # 늑대가 더 많으면 탐색 중단
        if wolf >= sheep or depth == len_node-1:
            nonlocal max_cnt
            max_cnt = max(max_cnt, sheep)
            return
        
        # 갈 수 있는 모든 경우 -> 바로 다음이든, 돌아가든, 갈 수 있는곳 -> 부모는 방문하고 자식은 방문안한곳
        for visit in visited:
            for child in graph[visit]:
                if child not in visited:
                    visited.append(child)
                    if info[child] == 1:
                        backtracking(sheep,wolf+1,depth+1)
                    else:
                        backtracking(sheep+1,wolf,depth+1)
                    visited.pop()
    
    visited.append(0)
    backtracking(1,0,0)
    
    return max_cnt