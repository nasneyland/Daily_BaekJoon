def solution(arr):
    # 초기 0,1 개수 셋팅
    cnt_0 = 0
    cnt_1 = 0
    for i in arr:
        for j in i:
            if j == 0:
                cnt_0 += 1
            else:
                cnt_1 += 1
    
    def check(x,y,size):
        # print("->   check")
        flag = None
        cnt = 0
        for i in range(x, x+size):
            for j in range(y, y+size):
                # print("                                     ",arr[i][j])
                if flag == None:
                    flag = arr[i][j]
                else:
                    cnt += 1
                    if flag != arr[i][j]:
                        return False
        
        if flag == 1:
            nonlocal cnt_1
            cnt_1 -= cnt
        else:
            nonlocal cnt_0
            cnt_0 -= cnt

        # print("->   cnt", cnt)
        return True
    
    def backtracking(x, y, size):
        # print(x,y,size)
        if size == 1:
            return
        if check(x,y,size):
            return
        
        half = size // 2
        backtracking(x, y, half) # 1사분면
        backtracking(x + half, y, size // 2) # 2사분면
        backtracking(x, y + half, size // 2) # 3사분면
        backtracking(x + half, y + half, size // 2) # 4사분면
    
    backtracking(0, 0, len(arr))
    return [cnt_0, cnt_1]