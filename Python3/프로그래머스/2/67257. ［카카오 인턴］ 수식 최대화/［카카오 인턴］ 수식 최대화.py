import itertools
import collections

def solution(expression):
    math_list = ["-", "*", "+"]
    # 연산자 쪼개서 리스트화 하기
    exp_list = []
    temp = ""
    for exp in expression:
        if exp not in math_list:
            temp += exp
        else:
            exp_list.append(int(temp))
            exp_list.append(exp)
            temp = ""
    exp_list.append(int(temp))
    
    # 연산자 우선순위 경우의 수 구하기
    ans = []
    cases = itertools.permutations(math_list, 3)
    for case in cases:
        queue = collections.deque(exp_list[:])
        for math in case: # 우선순위 대로 연산자 순회
            # 연산자를 만나면 연산하는 코드
            stack = []
            while queue:
                temp = queue.popleft()
                if temp == math:
                    before = stack.pop()
                    after = queue.popleft()
                    result = 0
                    if temp == "+":
                        result = before + after
                    elif temp == "*":
                        result = before * after
                    else:
                        result = before - after
                    stack.append(result)
                else:
                    stack.append(temp)
                    
            queue = collections.deque(stack[:])
            
        ans.append(abs(queue[0]))
                
    return max(ans)