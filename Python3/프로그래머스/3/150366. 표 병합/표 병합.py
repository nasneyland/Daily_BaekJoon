
def solution(commands):
    k = 51
    answer = []
    merged = [[(i, j) for j in range(k)] for i in range(k)]
    board = [["EMPTY"] * k for _ in range(k)]
    
    for command in commands:
        comm = command.split()
        
        if comm[0] == "UPDATE":
            if len(comm) == 4:
                row = int(comm[1])
                col = int(comm[2])
                text = comm[3]
                
                # 혹시 머지된 셀이면 최상위 머지셀에만 바꾸면 됨 (아니면 본인 셀 참조함)
                x,y = merged[row][col]
                board[x][y] = text
            else:
                text1 = comm[1]
                text2 = comm[2]
                
                # 값 하나하나 찾아서 바꾸기 -> 이렇게 해도 시간복잡도는 N이라 괜찮음!
                for i in range(k):
                    for j in range(k):
                        if board[i][j] == text1:
                            board[i][j] = text2
                
        elif comm[0] == "MERGE":
            row1 = int(comm[1])
            col1 = int(comm[2])
            row2 = int(comm[3])
            col2 = int(comm[4])
            x1, y1 = merged[row1][col1]
            x2, y2 = merged[row2][col2]
            
            # 앞에 값이 있으면 그 값을 사용하고, 뒤에만 있으면 뒤의 값을 앞으로 넣기 (둘다 empty면 그냥 empty 들어감)
            if board[x1][y1] == "EMPTY":
                board[x1][y1] = board[x2][y2]
                
            # 머지 관계 채우기
            for i in range(k):
                for j in range(k):
                    # 2번을 참조하고 있는게 있으면 1번을 참조하도록 병합하기!
                    if merged[i][j] == (x2, y2):
                        merged[i][j] = (x1, y1)
        
        elif comm[0] == 'UNMERGE':
            row = int(comm[1])
            col = int(comm[2])
            x, y = merged[row][col] # 병합된 부모셀
            tmp = board[x][y]
            
            for i in range(k):
                for j in range(k):
                    if merged[i][j] == (x,y): # 만약 병합된 셀이라면
                        merged[i][j] = (i,j) # 병합 해제
                        board[i][j] = "EMPTY" # 값 제거
                        
            board[row][col] = tmp # 병합해제한 셀에만 값 넣어주기
            
        elif comm[0] == "PRINT":
            row = int(comm[1])
            col = int(comm[2])
            x,y = merged[row][col]
            answer.append(board[x][y])
            
    return answer