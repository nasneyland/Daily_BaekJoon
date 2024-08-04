import itertools
import collections

def solution(friends, gifts):
    gift_list = collections.defaultdict(int)
    gift_point = collections.defaultdict(int)
    
    for gift in gifts:
        from_frd, to_frd = gift.split(" ")
        
        # 주고받은 선물 개수 계산
        gift_list[(from_frd, to_frd)] += 1
        
        # 선물지수 계산
        gift_point[from_frd] += 1
        gift_point[to_frd] -= 1
        
    result = collections.defaultdict(int)
    for frd_a, frd_b in itertools.combinations(friends, 2):
        if gift_list[(frd_a, frd_b)] < gift_list[(frd_b, frd_a)]:
            result[frd_b] += 1
        elif gift_list[(frd_a, frd_b)] > gift_list[(frd_b, frd_a)]:
            result[frd_a] += 1
        else:
            if gift_point[frd_a] < gift_point[frd_b]:
                result[frd_b] += 1
            elif gift_point[frd_a] > gift_point[frd_b]:
                result[frd_a] += 1

    return max(result.values()) if result else 0




