import collections

def solution(gems):
    # gems = ["a","a","a","b"]
    len_gems = len(gems)
    gem_cnt = len(set(gems))
    left_idx = 0
    right_idx = 0
    gem_collections = collections.defaultdict(int)
    result = []
    
    while left_idx != len_gems or right_idx != len_gems:
        # print(left_idx, right_idx)
        if len(gem_collections) == gem_cnt:
            if gem_collections[gems[left_idx]] == 1:
                gem_collections.pop(gems[left_idx])
            else:
                gem_collections[gems[left_idx]] -= 1
                
            left_idx += 1
            
            if result:
                if result[1] - result[0] > right_idx - left_idx:
                    result = [left_idx, right_idx]
                elif result[1] - result[0] == right_idx - left_idx:
                    if result[0] > left_idx:
                        result = [left_idx, right_idx]
            else:
                result = [left_idx, right_idx]
                
        elif right_idx == len_gems:
            left_idx += 1
            
        else:
            gem_collections[gems[right_idx]] += 1
            right_idx += 1
        
    return result
