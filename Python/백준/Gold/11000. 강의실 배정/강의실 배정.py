import sys
import heapq

n = int(sys.stdin.readline())
schedule = []
for _ in range(n):
    temp = sys.stdin.readline().split()
    schedule.append((int(temp[0]), int(temp[1])))

schedule.sort(key= lambda x: x[0])
temp = schedule[0][1]
heap = [temp]
cnt = 1

for i in range(1,n):
    # print(heap)
    if schedule[i][0] >= heap[0]:
        heapq.heappop(heap)
        cnt -= 1
        
    heapq.heappush(heap, schedule[i][1])
    cnt += 1
    
print(cnt)