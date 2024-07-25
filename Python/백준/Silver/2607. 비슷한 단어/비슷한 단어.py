import itertools
import collections
import heapq
import sys
from itertools import product

n = int(sys.stdin.readline())
input_list = []
for _ in range(n):
    # input_list.append(sys.stdin.readline())
    input_list.append(input())

# print(input_list)
cnt = 0
main_str = input_list[0]

for input_str in input_list[1:]:
    # print(input_str, "-----------")
    main_counter = collections.Counter(main_str)

    # 구성이 같은 경우
    if main_counter == collections.Counter(input_str):
        # print("구성같음")
        cnt += 1
        continue
    
    not_contain_cnt = 0
    end_flag = False

    for str in input_str:
        # print(str)
        if str in main_counter:
            if main_counter[str] == 1:
                main_counter.pop(str)
            else:
                main_counter[str] -= 1
        else:
            if not_contain_cnt != 0:
                end_flag = True
                break
            else:
                # 한번까지는 없어도 됨
                # print("없어")
                not_contain_cnt += 1
        # print("     ????", main_counter)

    if end_flag:
        continue
    elif len(main_counter) == 0:
        cnt += 1
        continue
    elif len(main_counter) == 1 and sum(main_counter.values()) == 1:
        cnt += 1
        # print("하나빼도됨")
        continue

print(cnt)