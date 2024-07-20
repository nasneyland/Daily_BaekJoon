import collections

def solution(land):
    dir4 = [(0,1),(0,-1),(1,0),(-1,0)]
    n = len(land)
    m = len(land[0])
    
    visited = {}
    ans = [0 for _ in range(m)]
    
    # 모든 지점 방문
    for i in range(n):
        for j in range(m):
            
            if (i,j) not in visited and land[i][j] == 1:
                # print("??",i,j)
                cols = []
                cnt = 0
                
                # bfs로 풀어보자
                queue = collections.deque([(i,j)])
                visited[(i,j)] = True
                
                cols.append(j)
                cnt += 1
                
                while queue:
                    x,y = queue.popleft()
                    
                    for d in dir4:
                        dx = x+d[0]
                        dy = y+d[1]
                        
                        if 0<=dx<n and 0<=dy<m and (dx,dy) not in visited and land[dx][dy] == 1:
                            queue.append((dx,dy))
                            visited[(dx,dy)] = True
                            
                            cols.append(dy)
                            cnt += 1
                           
                # print("첫 범위 추가추가해")
                for k in set(cols):
                    print(k)
                    ans[k] += cnt
                    
        # print(ans)
        
                
    return max(ans) 