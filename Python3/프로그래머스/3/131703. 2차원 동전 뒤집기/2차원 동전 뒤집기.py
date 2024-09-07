import sys

def solution(beginning, target):
    sys.setrecursionlimit(1000000)
    
    n = len(beginning)
    m = len(beginning[0])
    
    def reverse_row(ans, row):
        for col in range(m):
            ans[row][col] = 0 if ans[row][col] == 1 else 1
            
    def reverse_col(ans, col):
        for row in range(n):
            ans[row][col] = 0 if ans[row][col] == 1 else 1
    
    def backtracking(i,j,ans,cnt):
        # 행,열 다 돌면 종료
        if i == n and j == m:
            if ans == target:
                nonlocal result
                result = min(result, cnt) if result != -1 else cnt
        elif i == n:
            # print(j,"열 쳌")
            backtracking(i, j+1, ans, cnt)
            
            reverse_col(ans, j)
            backtracking(i, j+1, ans, cnt+1)
            reverse_col(ans, j)
        else:
            # print(i,"행 쳌")
            backtracking(i+1, j, ans, cnt)
            
            reverse_row(ans, i)
            backtracking(i+1, j, ans, cnt+1)
            reverse_row(ans, i)
    
    result = -1
    backtracking(0,0,beginning,0)
    return result