import heapq
import collections

def solution(jobs):
    cur_time = 0
    total_wait_time = 0
    n = len(jobs)
    
    # 대기중인 업무들
    jobs.sort()  # 시작 시간 기준으로 정렬
    queue = collections.deque(jobs)
    
    # 진행 가능한 업무들
    heap = []
    
    while queue or heap:
        
        # 현재 시간에 추가할 수 있는 모든 작업 힙에 넣기
        while queue and queue[0][0] <= cur_time:
            start_time, job_duration = queue.popleft()
            heapq.heappush(heap, (job_duration, start_time))
        
        if heap:
            job_duration, start_time = heapq.heappop(heap)
            
            cur_time += job_duration
            total_wait_time += cur_time - start_time
        else:
            # 대기 중인 작업이 없으면 다음 작업의 시작 시간으로 이동
            cur_time = queue[0][0]
    
    return total_wait_time // n