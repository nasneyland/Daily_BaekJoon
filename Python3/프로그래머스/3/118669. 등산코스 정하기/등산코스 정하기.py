import collections
import sys
import heapq

def solution(n, paths, gates, summits):

    summits = set(summits) 
    
    # 1. 그래프 만들자
    graph = collections.defaultdict(list)
    for path in paths:
        graph[path[0]].append((path[2],path[1]))
        graph[path[1]].append((path[2],path[0]))

    # 2. 출발지점 선언하자
    heap = []
    visited = [sys.maxsize] * (n+1) 

    for gate in gates: 
        heapq.heappush(heap,(0, gate))
        visited[gate] = 0 

    # 3. 다익스트라
    while heap:
        cur_dir, cur_node = heapq.heappop(heap)
        # print(cur_node, cur_dir,"=============")

        if cur_dir > visited[cur_node] or cur_node in summits: 
            continue

        for next_dir, next_node in graph[cur_node]:
            # print(next_node)
            max_dir = max(cur_dir, next_dir)
            if max_dir < visited[next_node]: 
                # print("     갱갱갱신", next_node, max_dir)
                heapq.heappush(heap, (max_dir, next_node))
                visited[next_node] = max_dir


    # print(visited)
    result = [0, sys.maxsize]
    for summit in sorted(summits):
        if visited[summit] < result[1]:
            result = [summit, visited[summit]]

    return result