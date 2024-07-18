def solution(word):
    
    alpha_list = ["A","E","I","O","U"]
    cnt = 0
    
    def backtracking(ans):
        # print(ans)
        nonlocal cnt
        cnt += 1
        
        if "".join(ans) == word:
            return True
        
        if len(ans) == 5:
            return False
        
        for alpha in alpha_list:
            ans.append(alpha)
            if backtracking(ans):
                return True
            ans.pop()
        
        
    for s in alpha_list:
        if backtracking([s]):
            return cnt
        
    return 0