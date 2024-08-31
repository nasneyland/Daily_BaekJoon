import collections

def solution(bandage, health, attacks):
    my_hp = health
    band_sum = 0
    
    queue = collections.deque(attacks)
    last_attack_time = attacks[-1][0]
    
    for cur_time in range(last_attack_time+1):
        
        # 괴물이 공격한다면?
        if cur_time == queue[0][0]:
            temp = queue.popleft()
            my_hp -= temp[1] # 생명력 감소
            band_sum = 0 # 붕대감기 초기화
        else:
            my_hp = min(health, my_hp + bandage[1])
            band_sum += 1
            
            # 붕대감기를 무사히 완료한다면?
            if band_sum == bandage[0]:
                my_hp = min(health, my_hp + bandage[2])
                band_sum = 0
            
        if my_hp <= 0:
            return -1
        
    return my_hp