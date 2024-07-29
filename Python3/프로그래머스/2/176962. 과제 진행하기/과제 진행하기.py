import collections

# 처음 제출한 코드
def solution(plans):
    k = len(plans)
    
    # 데이터 포맷 변환
    plan_init_list = []
    for plan in plans:
        temp_time = plan[1].split(":")
        temp_hour = int(temp_time[0]) * 60
        temp_min = int(temp_time[1])
        start_time = temp_hour + temp_min
        
        plan_init_list.append([plan[0], start_time, int(plan[2])])
        
    # 시작시간 순으로 정렬
    plan_init_list.sort(key= lambda x: x[1])
    
    plan_list = collections.deque(plan_init_list)
    temp_list = collections.deque()
    ans = []
    
    cur_plan = plan_list.popleft()
    
    while plan_list or temp_list:
        # print("cur", cur_plan)
        
        # 새로운 플랜 먼저 고려
        if plan_list:
            new_plan = plan_list[0]
            # print("new", new_plan)
            
            # 새로운 플랜이 지금 플랜을 가로채는 경우 (지금 플랜의 종료시간 > 새로운 플랜의 시작시간)
            if cur_plan[1] + cur_plan[2] > new_plan[1]:
                # print("새로운 플랜이 지금 플랜을 가로채는 경우")
                minus_time = new_plan[1] - cur_plan[1]
                
                # 현재플랜 시간 줄여준 다음 대기열로
                cur_plan[2] -= minus_time
                temp_list.append(cur_plan)
                
                # 다음플랜 시작하기
                cur_plan = plan_list.popleft()
                
                continue
                
            # 새로운 플랜이 지금 플랜 종료시간과과 시간이 같은 경우
            elif cur_plan[1] + cur_plan[2] == new_plan[1]:
                # print("새로운 플랜이 지금 플랜 종료시간과과 시간이 같은 경우")
                # 현재작업 종료
                ans.append(cur_plan[0])
                
                # 다음플랜 시작하기
                cur_plan = plan_list.popleft()
                    
                continue
            
            # 다음 플랜이 아직 준비가 안된경우
            else:
                # print("다음 플랜이 아직 준비가 안된경우", cur_plan[1] + cur_plan[2], new_plan[1])
                ans.append(cur_plan[0])
                
                if temp_list: # 대기열이 있으면 대기열에서 뽑기
                    new_plan = temp_list.pop()
                    new_plan[1] = cur_plan[1] + cur_plan[2] # 현 플랜의 종료시간 = 뉴 플랜의 시작시간
                    cur_plan = new_plan
                else: # 없으면 그냥 다음 작업 시작
                    cur_plan = plan_list.popleft()
                    
                continue
            
        # 새로운 플랜이 없으면 그냥 temp 시작
        new_plan = temp_list.pop()
        # print("새로운 플랜이 없으면 그냥 temp 시작", new_plan)
        ans.append(cur_plan[0])
        cur_plan = new_plan
        
    # 마지막 하나 넣기
    ans.append(cur_plan[0])
              
    return ans
