import sys

def solution(distance, rocks, n):
    rocks.append(distance)
    rocks.sort()
    
    left = 0
    right = distance
    answer = 0
    
    while left<=right:
        mid = (left+right)//2
        # print("mid: ", mid, "-------------------")
        
        min_distance = sys.maxsize
        current = 0
        remove_cnt = 0
        
        for rock in rocks:
            # print("rock: ", rock,)
            diff = rock - current
            if diff<mid:
                # print("     빼자")
                remove_cnt+=1
            else:
                current = rock
                min_distance = min(min_distance,diff)
                # print("     최소거리", min_distance)
                
        if remove_cnt>n:
            right = mid-1
            # print("=> 너무 많이 뺌")
        else:
            answer = min_distance # 혹시나 이게 최적값이 될 수 있으니 일단 저장저장~
            left = mid+1
            # print("=> 괜찮게 뺌", remove_cnt, min_distance) 
    return answer