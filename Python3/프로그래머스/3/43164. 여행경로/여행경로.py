import collections
import sys

def solution(tickets):
    sys.setrecursionlimit(10000)
    
    graph = collections.defaultdict(list)
    total_cnt = collections.defaultdict(int)
    for ticket in tickets:
        graph[ticket[0]].append(ticket[1])
        total_cnt[(ticket[0], ticket[1])] += 1
        
    def backtracking(ans, visited):
        if len(ans) == len(tickets) + 1:
            result.append(ans[:])
            return
        
        cur = ans[-1]
        for next in graph[cur]:
            if (cur, next) not in visited or visited[(cur, next)] < total_cnt[(cur,next)]:
                ans.append(next)
                visited[(cur, next)] += 1
                backtracking(ans, visited)
                ans.pop()
                visited[(cur, next)] -= 1
           
    result = []
    visited = collections.defaultdict(int)
    backtracking(["ICN"], visited)
    result.sort()
    return result[0]