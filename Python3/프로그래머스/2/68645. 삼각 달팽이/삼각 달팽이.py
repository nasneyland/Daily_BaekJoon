def solution(n):  
    # 삼각형 만들기
    answer = []
    for i in range(n):
        answer.append([0] * (i + 1))
          
    x, y = -1, 0
    num = 1     
    for i in range(n): 
        print(i)    
        for j in range(i, n):
                        
            if i % 3 == 0: # 아래로              
                x += 1            
            elif i % 3 == 1: # 오른쪽으로               
                y += 1            
            else: # 위로             
                x -= 1                
                y -= 1            
                
            # 현재 위치에 숫자 채우기
            answer[x][y] = num            
            num += 1     
    return sum(answer, [])
