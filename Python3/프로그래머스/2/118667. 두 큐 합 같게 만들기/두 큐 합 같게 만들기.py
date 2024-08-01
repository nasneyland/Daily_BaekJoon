import collections

def solution(queue1, queue2):
    queue1 = collections.deque(queue1)
    queue2 = collections.deque(queue2)
    total = len(queue1) + len(queue2)
    cnt = 0
    
    sum_1 = sum(queue1)
    sum_2 = sum(queue2)
    
    while cnt < (total * 4):
        # print(queue1, queue2)
        
        if sum_1 == sum_2:
            return cnt
        elif sum_1 > sum_2:
            temp = queue1.popleft()
            queue2.append(temp)
            sum_1 -= temp
            sum_2 += temp
        elif sum_1 < sum_2:
            temp = queue2.popleft()
            queue1.append(temp)
            sum_2 -= temp
            sum_1 += temp
        
        cnt += 1
            
    return -1