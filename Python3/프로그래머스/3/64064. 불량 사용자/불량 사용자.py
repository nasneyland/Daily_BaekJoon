import itertools

def solution(user_id, banned_id):
    result = []
    for ban in banned_id:
        # print(ban, "===================")
        ans = []
        for user in user_id:
            cnt = 0
            
            if len(ban) == len(user):
                for i in range(len(ban)):
                    if ban[i] == "*" or ban[i] == user[i]:
                        cnt += 1
            else:
                continue
                 
            if cnt == len(user):
                ans.append(user)
        
        result.append(ans)
        
    result_set = set()
    for re in itertools.product(*result):
        if len(set(re)) == len(re):
            result_set.add(tuple(sorted(re)))
        
    # print(result_set)
    return len(result_set)