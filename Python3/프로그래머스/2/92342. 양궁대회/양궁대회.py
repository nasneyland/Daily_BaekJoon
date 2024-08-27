def solution(n, info):
    max_score = 0
    result = []
    
    # 어피치랑 라이언 점수 계산
    def calculate_score(ans):
        appech_score = 0
        lion_score = 0
        for idx, score in enumerate(info):
            if score + ans[idx] == 0:
                continue
            if score >= ans[idx]:
                # 어피치 승리
                appech_score += (10 - idx)
            else:
                # 라이언 승리
                lion_score += (10 - idx)
        return lion_score - appech_score
    
    def backtracking(ans, cnt, i):
        
        # 마지막 화살까지 쏘면 종료
        if i == n + 1: 
            # print(ans, cnt)
            if cnt == n:
                score = calculate_score(ans)
                
                nonlocal result
                nonlocal max_score
                
                if score > 0:
                    if max_score < score:
                        result = [ans[:]]
                        max_score = score
                    elif max_score == score:
                        result.append(ans[:])
            return

        ans[i] = min(n-cnt, info[i] + 1)
        backtracking(ans[:], cnt + ans[i], i+1)
        
        ans[i] = 0
        backtracking(ans[:], cnt + ans[i], i+1)
               
    backtracking([0] * 11, 0, 0)
    
    if not result:
        return [-1]
    if len(result) == 1:
        return result[0]
    
    result.sort(key= lambda x: (x[10],x[9],x[8],x[7],x[6],x[5],x[4],x[3],x[2],x[1],x[0]))
    return result[-1]