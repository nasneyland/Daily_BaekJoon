from collections import defaultdict

def solution(gems):
    answer = [0,len(gems)]
    left,right =0,0 # left: 보석빼기용, right: 보석추가용
    type_cnt = len(set(gems))
    gem_dict = defaultdict(int)
    
    while 1:
        if left == len(gems) and right == len(gems):
            break
        # 딕셔너리에 보석 종류가 다 들어온 경우
        if len(gem_dict) == type_cnt:
            # 최소크기라면
            if right-left < answer[1]-answer[0]:
                answer = [left,right]
            # 최소크기가 아니라면
            else:
                gem_dict[gems[left]] -= 1 # 왼쪽 보석 빼보기
                if gem_dict[gems[left]] == 0:
                    del gem_dict[gems[left]] #cnt가 0이라면 딕셔너리에서 빼줘야함
                left+=1

        elif right == len(gems):
            left += 1
            
        else:
            gem_dict[gems[right]] += 1
            right += 1
    
    return [answer[0]+1, answer[1]] # 시작인덱스가 1부터 시작