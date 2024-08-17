import collections

def solution(rc, operations):
    len_row = len(rc)
    len_col = len(rc[0])
        
    start = collections.deque()
    mid = collections.deque()
    end = collections.deque()
    
    for row in rc:
        start.append(row[0])
        temp_queue = collections.deque(row[1:len_col-1])
        mid.append(temp_queue)
        end.append(row[-1])
        
    # print(start,mid,end)
        
    for operation in operations:
        if operation == "Rotate":
            mid[0].appendleft(start.popleft())
            
            temp_m = mid[0].pop()
            end.appendleft(temp_m)
            
            temp_e = end.pop()
            mid[-1].append(temp_e)
            
            temp_m = mid[-1].popleft()
            start.append(temp_m)
        elif operation == "ShiftRow":
            start.rotate()
            mid.rotate()
            end.rotate()
            
    # print(start,mid,end)
    
    result = []
    for r in range(len_row):
        temp = []
        temp.append(start[r])
        temp += mid[r]
        temp.append(end[r])
        result.append(temp)

    return result