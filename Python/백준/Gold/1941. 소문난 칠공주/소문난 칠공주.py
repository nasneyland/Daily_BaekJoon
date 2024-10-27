from collections import deque

dir4 = [(-1,0),(1,0),(0,-1),(0,1)]
def bfs(i,j):
    queue = deque()
    visit_list = [[0]*5 for _ in range(5)]

    queue.append((i,j))
    visit_list[i][j]=1
    cnt = 1

    while queue:
        temp = queue.popleft()
        for d in dir4:
            dx = temp[0] + d[0]
            dy = temp[1] + d[1]

            if 0<=dx<5 and 0<=dy<5 and visit_list[dx][dy]==0 and visited[dx][dy]==1:
                queue.append((dx,dy))
                visit_list[dx][dy]=1
                cnt+=1
    return cnt==7

def check():
    # 전체 그래프에서 한놈만 잡아서 bfs 돌리기
    for i in range(5):
        for j in range(5):
            if visited[i][j]==1:
                return bfs(i,j)

def backtracking(i, j, cnt, scnt):
    global ans
    
    # 종료조건: 이미 7명을 넘었으면 7공주 불가!
    if cnt>7:                   
        return

    # 끝까지 순회한 경우
    if i == 5:
        # 7명을 모았고, 4명 이상이 다솜파인 경우
        if cnt==7 and scnt>=4:
            # 7개가 인접했는지 체크하기!!!
            if check():
                ans+=1
        return

    next_i = i + 1 if j == 4 else i
    next_j = 0 if j == 4 else j + 1
    
    # 포함하는 경우 표시
    visited[i][j]=1
    backtracking(next_i, next_j, cnt+1, scnt+int(arr[i][j]=='S'))
    visited[i][j]=0
    
    # 포함하지 않는 경우
    backtracking(next_i, next_j, cnt, scnt)         


arr = [input() for _ in range(5)]
visited = [[0]*5 for _ in range(5)]

ans = 0
backtracking(0, 0, 0, 0)
print(ans)