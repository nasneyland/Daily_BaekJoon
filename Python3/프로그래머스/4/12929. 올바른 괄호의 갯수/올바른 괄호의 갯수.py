def solution(n):
    def checkValid(ans):
        stack = []
        for a in ans:
            if not stack:
                stack.append(a)
            else:
                if a == ")":
                    if stack[-1] == "(":
                        stack.pop()
                    else:
                        return False
                else:
                    stack.append(a)   
        if not stack:
            return True
        return False
    
    def backtracking(ans, open_cnt, close_cnt, cnt):
        # print(ans)
        if cnt == n*2:
            nonlocal result
            result += 1
            return
            
        if open_cnt < n:
            ans.append("(")
            backtracking(ans, open_cnt+1, close_cnt, cnt + 1)
            ans.pop()
            
        if close_cnt < open_cnt:
            ans.append(")")
            backtracking(ans, open_cnt, close_cnt+1, cnt + 1)
            ans.pop()
    
    result = 0
    backtracking([],0,0,0)
    
    return result