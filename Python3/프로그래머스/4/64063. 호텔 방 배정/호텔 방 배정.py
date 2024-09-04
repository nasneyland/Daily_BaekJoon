def solution(k, room_number):
    result = []
    full = {}
    for room in room_number:
        if room not in full:
            # 빈방이면
            full[room] = room + 1
            result.append(room)
        else:
            # 이미 찬 방이면
            temp = []
            next = room
            while next in full:
                next = full[next]
                temp.append(next)
            
            for t in temp:
                full[t] = next + 1

            result.append(next)
                
    return result