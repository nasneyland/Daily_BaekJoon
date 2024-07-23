import heapq

def solution(jobs):
    
    cur_time = 0
    result = []
    
    # 전체 작업 대기행렬
    ready_heap = []
    
    for job in jobs:
        heapq.heappush(ready_heap, (job[0], job[1]))
    
    working_heap = []    
    while ready_heap or working_heap:
        
        while ready_heap and ready_heap[0][0] <= cur_time:
            temp_start, temp_cost = heapq.heappop(ready_heap)
            heapq.heappush(working_heap, (temp_cost, temp_start))
            
        if working_heap and working_heap[0][1] <= cur_time:
            cur_cost, cur_start = heapq.heappop(working_heap)
            cur_time += cur_cost
            
            result.append(cur_time - cur_start)
        else:
            cur_time += 1
    
    return sum(result) // len(result)