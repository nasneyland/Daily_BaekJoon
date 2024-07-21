import itertools

def solution(k, dungeons):
    len_dungeon = len(dungeons)
    cases = list(itertools.permutations(range(len_dungeon), len_dungeon))
    max_cnt = 0
    
    for case in cases:
        heart = k
        cnt = 0

        for c in case:
            if heart >= dungeons[c][0]:
                heart -= dungeons[c][1]
                cnt += 1
            else:
                break
        
        # print(case, cnt, "소요됨")
        max_cnt = max(max_cnt, cnt)

    return max_cnt