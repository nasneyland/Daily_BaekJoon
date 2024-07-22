def solution(msg):
    ans = []
    stack = []
    
    msg += " "
    
    # str 사전 초기 셋팅
    str_dict = {}
    last_idx = 1
    for (i, str) in enumerate(range(65,91)):
        str_dict[chr(str)] = i + 1
        last_idx += 1
        
    for m in msg:
        stack_str = "".join(stack)
        new_str = stack_str + m
        if not stack or new_str in str_dict:
            stack.append(m)
        else:
            # 사전추가 작업
            str_dict[new_str] = last_idx
            last_idx += 1
            
            # 출력 작업
            ans.append(str_dict[stack_str])
            stack = []
            
            stack.append(m)
            
    return ans