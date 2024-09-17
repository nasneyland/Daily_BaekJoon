import itertools
import collections
import bisect

def solution(dice):
    len_dice = len(dice)
    max_cnt = 0
    result = []
    dic = {}
    
    # 주사위를 가져갈 경우의 수
    cases = itertools.combinations(range(len_dice), len_dice // 2)
    for case in cases:
        # print(case, "-----------------")
        a_case = list(case)
        b_case = []
        for b in range(len_dice):
            if b not in a_case:
                b_case.append(b)
            
        # a가 날 수 있는 점수 list
        a_case_list = [dice[temp] for temp in a_case]
        a_scord_list = [sum(combination) for combination in itertools.product(*a_case_list)]
        # print("a", a_scord_list)
        
        # b가 날 수 있는 점수 list
        b_case_list = [dice[temp] for temp in b_case]
        b_scord_list = [sum(combination) for combination in itertools.product(*b_case_list)]
        # print("b", b_scord_list)
        
        cnt = 0
        b_scord_list.sort()
        for a in a_scord_list:
            # b의 리스트에서 a가 어디에 있는지 (비기는 것도 안되므로 bisect_left를 사용하)
            cnt += bisect.bisect_left(b_scord_list, a)
        
        if max_cnt < cnt:
            max_cnt = cnt
            result = [a+1 for a in a_case]
                    
    return result