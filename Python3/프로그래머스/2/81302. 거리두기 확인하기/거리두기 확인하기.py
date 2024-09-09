import collections 

def solution(places):
    n = 5
    dir4 = [(0,1),(0,-1),(1,0),(-1,0)]
    result = []
    
    for cases in places:
        # 케이스별 살펴보기
        # print(cases,"-------------")
        
        place_map = []
        queue = collections.deque()
        
        for i,case in enumerate(cases):
            case_list = list(case)
            place_map.append(case_list)
            
            for j,item in enumerate(case_list):
                if item == "P":
                    visited = {(i,j): True}
                    queue.append((i,j,0,visited))
          
        flag = 1
        
        while queue:
            x,y,depth,visited = queue.popleft()
            # print(x,y,depth)
            
            if flag == 0:
                break
            
            for d in dir4:
                dx = x+d[0]
                dy = y+d[1]
                
                if 0<=dx<n and 0<=dy<n and (dx,dy) not in visited and depth != 2:
                    if place_map[dx][dy] == "O":
                        visited[(dx,dy)] = True
                        queue.append((dx,dy,depth+1,visited))
                    elif place_map[dx][dy] == "P":
                        flag = 0
                        break
                    
        result.append(flag)
                
    return result