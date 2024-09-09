import sys

def solution(n, m, x, y, r, c, k):
    sys.setrecursionlimit(987654321)
    dir4 = [(1,0),(0,-1),(0,1),(-1,0)]
    dir_str = ["d","l","r","u"]
    
    x-=1
    y-=1
    r-=1
    c-=1
    
    result = ""
    
    def dfs(i,j,depth,path):
        nonlocal result
        if result != "":
            return
        
        if depth == k and i == r and j == c:
            result = path
            return

        if depth != k and abs(i-r) + abs(j-c) <= k - depth:
            for idx,d in enumerate(dir4):
                dx = i+d[0]
                dy = j+d[1]
                if 0<=dx<n and 0<=dy<m:
                    dfs(dx,dy,depth+1,path+dir_str[idx])
        return
    
    if ((abs(x-r) + abs(y-c)) % 2) != (k%2):
        return "impossible"
    else:
        dfs(x,y,0,"")
        
    return result if result != "" else "impossible"