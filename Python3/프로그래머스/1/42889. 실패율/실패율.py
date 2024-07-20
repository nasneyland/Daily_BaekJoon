def solution(N, stages):
    persons = len(stages)
    distance = [0 for _ in range(N+2)]
    
    for idx, stage in enumerate(stages):
        distance[stage] += 1
    
    cnt = 0
    ans = []
    for idx in range(1,N+1):
        total = persons - cnt
        non_pass = distance[idx]
        cnt += non_pass
        
        if total != 0:
            ans.append((idx, non_pass/total))
        else:
            ans.append((idx, 0))
        
    ans.sort(key= lambda x: (-x[1], x[0]))
    
    result = []
    for a in ans:
        result.append(a[0])
        
    return result