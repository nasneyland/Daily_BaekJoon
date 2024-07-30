import collections
import sys

n = int(sys.stdin.readline())
board = []

start_point = (0,0,0)
k = 0

for i in range(n):
    input_list = list(map(int, sys.stdin.readline().split()))
    for j, num in enumerate(input_list):
        if num == 9:
            input_list[j] = 0
            start_point = (i,j,0)
        elif num != 0:
            k += 1
    board.append(input_list)
    
m = len(board[0])
    
# BFS로 풀자
dir4 = [(0,1),(0,-1),(1,0),(-1,0)]

cur_shark_point = start_point
shark_size = 2
shark_full = 0
step = 0

# 물고기가 있는 한 계속 반복한다
while k != 0:
# for _ in range(1):
    queue = collections.deque([cur_shark_point])
    visited = {(cur_shark_point[0], cur_shark_point[1]): True}
    
    min_depth = sys.maxsize
    fish_list = []

    # 상어가 잡아먹을 다음 물고기 탐색한다
    while queue:
        i,j,depth = queue.popleft()
        
        # 상어보다 작은 물고기를 만났다면?
        if 0< board[i][j] < shark_size and depth <= min_depth:
            # 먹고싶다.. 하지만 같은 거리의 다른 우선순위가 있을 수 있으므로 일단 후보열에 넣자
            min_depth = depth
            fish_list.append((i,j))
            
        for d in dir4:
            dx = i + d[0]
            dy = j + d[1]
            
            # 보드 안에 존재하거나, 상어크기보다 작거나 같아야 하고, 방문하지 않았어야 한다.
            if 0<=dx<n and 0<=dy<m and (dx,dy) not in visited and board[dx][dy] <= shark_size and depth <= min_depth:
                queue.append((dx,dy,depth+1))
                visited[(dx,dy)] = True
                
    if len(fish_list) == 0:
        # print("stop")
        break
    else:
        fish_list.sort(key= lambda x: (x[0], x[1]))
        fx,fy = fish_list[0]
        
        board[fx][fy] = 0 # 물고기 제거
        k -= 1 # 전체 물고기수 카운트 다운
        cur_shark_point = (fx, fy, 0) # 상어 위치 변경
        step += min_depth # 전체 걸음 수 체크하기
        shark_full += 1 # 물고기 먹은거 배 채우기
        
        if shark_full == shark_size:
            shark_size += 1
            shark_full = 0
            
        # print(fx,fy, "size", shark_size, "full", shark_full, "step", step)
# print(board)
print(step)