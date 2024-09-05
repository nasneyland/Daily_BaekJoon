import sys

def solution(routes):
    routes.sort(key= lambda x: x[1])
    last_camera = sys.maxsize * -1

    cnt = 0

    for route in routes:
        route.sort()
        if route[0] > last_camera:
            last_camera = route[1]
            cnt += 1

    return cnt