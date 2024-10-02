def solution(n, times):
    left = 0
    right = max(times) * n
    answer = 0

    while left <= right:
        mid = (left + right) // 2
        
        cnt = 0
        for time in times:
            cnt += int(mid // time)
            
            if cnt == n:
                answer = mid

        if cnt < n:
            left = mid + 1
        else:
            answer = mid  # 최소 시간을 업데이트
            right = mid - 1

    return answer