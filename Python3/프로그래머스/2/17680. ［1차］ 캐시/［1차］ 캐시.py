import collections

def solution(cacheSize, cities):
    queue = collections.deque()
    cnt = 0
    
    if cacheSize == 0:
        return len(cities) * 5
    
    for city_raw in cities:
        city = city_raw.upper()
        if city in queue:
            # 캐시에 도시가 있으면
            cnt += 1
            # 위치 바꿔줘야하나? o
            queue.remove(city)
            queue.append(city)
        else:
            # 캐시에 도시가 없으면
            cnt += 5
            
            if queue and len(queue) == cacheSize: # 꽉찼으면
                queue.popleft()
                
            queue.append(city)
            
    return cnt