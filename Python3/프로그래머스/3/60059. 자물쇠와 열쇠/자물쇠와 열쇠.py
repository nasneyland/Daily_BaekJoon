# 240527 / 2번 제출만에 성공 / 30분
def solution(key, lock):
    len_lock = len(lock)
    len_key = len(key)
    
    lock_cnt = 0
    
    # 키 회전
    def rotate90(board):
        len_board = len(board)
        rotated_map = [[0]*len_board for _ in range(len_board)]
        
        for r in range(len_board):
            for c in range(len_board):
                rotated_map[len_board - r - 1][c] = board[c][r]
                
        return rotated_map
    
    # 모서리만 맞아도 되기때문에 키랑 매칭할 여유공간 셋팅하기
    margin_board = (len_key - 1)
    margins_board = margin_board * 2
    len_board = len_lock + margins_board
     
    board = []
    for i in range(len_board):
        if i < margin_board or i > len_board - margin_board-1:
            board.append([9 for i in range(len_board)])
        else:
            temp = []
            for j in range(len_board):
                if j < margin_board or j > len_board - margin_board-1:
                    temp.append(9)
                else:
                    lock_value = lock[i-margin_board][j-margin_board]
                    temp.append(lock_value)
                    if lock_value == 0:
                        lock_cnt += 1
            board.append(temp)
            
    # 회전한 키와 딱 맞는 곳 있는지 체크
    rotated_key = key
    for _ in range(4):
        rotated_key = rotate90(rotated_key) # 키 회전
        
        # 전체 자물쇠 영역 순회
        for x in range(0,len_board-(len_key-1)):
            for y in range(0,len_board-(len_key-1)):
                # print(x,y)
                
                temp_cnt = 0
                # 키 전체 순회
                for i in range(len_key):
                    for j in range(len_key):
                        if rotated_key[i][j] == 1 and board[i+x][j+y] == 0:
                            temp_cnt += 1
                            # print("맞는곳", temp_cnt)
                        if rotated_key[i][j] == 1 and board[i+x][j+y] == 1:
                            break # ✅ 1번째 제출에서 이부분 놓침 ✅
                            
                if temp_cnt == lock_cnt:
                    # print("정답")
                    return True
    return False