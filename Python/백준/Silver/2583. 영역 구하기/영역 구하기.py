import sys
import collections

m,n,k = map(int, sys.stdin.readline().split())
filled = {}
visited = {}
total_cnt = 0
result = []

for _ in range(k):
    start_x, start_y, end_x, end_y = map(int, sys.stdin.readline().split())
    for i in range(start_y, end_y):
        for j in range(start_x,end_x):
            filled[(i,j)] = True

# BFS 시작
dir4 = [(0,1),(0,-1),(1,0),(-1,0)]
for i in range(m):
    for j in range(n):
        
        # 순수 영역만 방문하기
        cur_cost = 0
        if (i,j) not in filled and (i,j) not in visited:
            total_cnt +=1
            
            queue = collections.deque([(i,j)])
            visited[(i,j)] = True
            
            while queue:
                x,y = queue.popleft()
                cur_cost += 1
                
                for d in dir4:
                    dx = x+d[0]
                    dy = y+d[1]
                    
                    if 0<=dx<m and 0<=dy<n:
                        if (dx,dy) not in filled and (dx,dy) not in visited:
                            queue.append((dx,dy))
                            visited[(dx,dy)] = True
                        
            result.append(cur_cost)
            
print(total_cnt)
print(" ".join(map(str, sorted(result))))