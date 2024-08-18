from typing import List
import time
import itertools
import collections
import copy
import sys

def solution(board):
    dir4 = [(0,1),(0,-1),(1,0),(-1,0)]
    horizon_dir = [(0,0,-1,-1),(0,0,1,-1),(-1,1,0,0),(1,1,0,0)]
    horizon_check = [(-1,1),(1,1),(-1,0),(1,0)]
    vertical_dir = [(0,0,-1,1),(0,0,-1,-1),(1,-1,0,0),(1,1,0,0)]
    vertical_check = [(1,1),(1,-1),(0,-1),(0,1)]
    
    n = len(board)
    m = len(board[0])
    
    # 전진하는 함수
    def go_node(d,start,end):
        x1 = start[0]+d[0]
        y1 = start[1]+d[1]
        x2 = end[0]+d[0]
        y2 = end[1]+d[1]
        if 0<=x1<n and 0<=y1<m and 0<=x2<n and 0<=y2<m and board[x1][y1] == 0 and board[x2][y2] == 0:
            return [(x1,y1),(x2,y2)]
        else:
            return None
    
    # 회전하는 함수
    def rotate_node(d,check,start,end):
        x1 = start[0]+d[0]
        y1 = start[1]+d[1]
        x2 = end[0]+d[2]
        y2 = end[1]+d[3]
        check_x = start[0]+check[0]
        check_y = start[1]+check[1]
        if 0<=x1<n and 0<=y1<m and 0<=x2<n and 0<=y2<m and board[x1][y1] == 0 and board[x2][y2] == 0 and board[check_x][check_y] == 0:
            return [(x1,y1),(x2,y2)]
        else:
            return None
    
    # BFS 시작
    queue = collections.deque()
    visited = {}
    
    start_nodes = sorted([(0,0),(0,1)])
    start_node = (start_nodes[0],start_nodes[1])
    queue.append((start_node, True, 0))
    visited[start_node] = True
    
    while queue:
        (start, end), isHorizontal, depth = queue.popleft()
        # print(start,end,isHorizontal,depth,"==========")
        
        if start == (n-1, m-1) or end == (n-1, m-1):
            return depth
        
        # 앞으로 가는 경우
        for d in dir4:
            get_next_nodes = go_node(d,start,end)
            if get_next_nodes:
                next_nodes = sorted(get_next_nodes)
                next_node = (next_nodes[0],next_nodes[1])
                if next_node not in visited:
                    queue.append((next_node, isHorizontal,depth+1))
                    visited[next_node] = True
                    
        # 회전하는 경우
        dir_list = horizon_dir if isHorizontal else vertical_dir
        check_list = horizon_check if isHorizontal else vertical_check
        for i in range(4):
            get_next_nodes = rotate_node(dir_list[i], check_list[i], start,end)
            if get_next_nodes:
                next_nodes = sorted(get_next_nodes)
                next_node = (next_nodes[0],next_nodes[1])
                if next_node not in visited:
                    queue.append((next_node, not isHorizontal,depth+1))
                    visited[next_node] = True
            
    return -1