def solution(board, skill):
    n = len(board)
    m = len(board[0])
    
    memo = [[0 for _ in range(m+1)] for _ in range(n+1)]
    
    # 누적합 기록하기
    for sk in skill:
        sum = sk[5] if sk[0] == 2 else sk[5] * -1
        memo[sk[1]][sk[2]] += sum
        memo[sk[3]+1][sk[4]+1] += sum
        memo[sk[1]][sk[4]+1] += sum * -1
        memo[sk[3]+1][sk[2]] += sum * -1
        
    # 행순회
    for i in range(n):
        for j in range(m):
            memo[i][j+1] += memo[i][j]
            
    # 열순회
    for j in range(m):
        for i in range(n):
            memo[i+1][j] += memo[i][j]
            
    # 합 적용하기
    cnt = 0
    for i in range(n):
        for j in range(m):
            if board[i][j] + memo[i][j] > 0:
                cnt += 1
            board[i][j] += memo[i][j]
    
    return cnt