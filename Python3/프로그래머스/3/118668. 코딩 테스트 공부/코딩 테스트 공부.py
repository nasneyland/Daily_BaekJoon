import heapq

# 처음 푼 코드 -> 힙으로 정확도 통과 (효율성 실패)
def solution(alp, cop, problems):
    
    n = len(problems)
    
    # 최대 구현력 구하기
    max_alp = 0
    max_cop = 0
    for problem in problems:
        max_alp = max(problem[0], max_alp)
        max_cop = max(problem[1], max_cop)
    
    # heap = (총소요시간, problem)
    heap = []
    heapq.heappush(heap, (0, alp, cop))
    
    visited = {(alp, cop): 0}
        
    while heap:
        (cur_cost, cur_alp, cur_cop) = heapq.heappop(heap)
        # print(cur_cost, cur_alp, cur_cop, visited)
        
        cur_alp = min(max_alp, cur_alp)
        cur_cop = min(max_cop, cur_cop)
        
        # 전부 만족하면 비용 내보내기
        if max_alp <= cur_alp and max_cop <= cur_cop:
            # print("return", visited)
            return cur_cost
        
        if cur_alp < max_alp:
            if (cur_alp + 1, cur_cop) not in visited or visited[(cur_alp + 1, cur_cop)] > cur_cost + 1:
                heapq.heappush(heap, (cur_cost + 1, cur_alp + 1, cur_cop))
                visited[(cur_alp + 1, cur_cop)] = cur_cost + 1
            
        if cur_cop < max_cop:
            if (cur_alp, cur_cop + 1) not in visited or visited[(cur_alp, cur_cop + 1)] > cur_cost + 1:
                heapq.heappush(heap, (cur_cost + 1, cur_alp, cur_cop + 1))
                visited[(cur_alp, cur_cop + 1)] = cur_cost + 1
        
        for i, problem in enumerate(problems):
            # print("ploblem", problem, cur_alp, cur_cop)
            
            if cur_alp >= problem[0] and cur_cop >= problem[1]:
                temp_cost = cur_cost + problem[4]
                temp_alp = cur_alp + problem[2]
                temp_cop = cur_cop + problem[3]
                if (temp_alp, temp_cop) not in visited or visited[(temp_alp, temp_cop)] > temp_cost:
                    heapq.heappush(heap, (temp_cost, temp_alp, temp_cop))
                    visited[(temp_alp, temp_cop)] = temp_cost
    answer = 0
    return answer