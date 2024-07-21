import itertools

def solution(relation):
    len_relation = len(relation[0])
    case_list = []
    result = []
    
    for i in range(1,len_relation+1):
        cases = list(itertools.combinations(range(len_relation), i))
        case_list += set(cases)
        
    for case in case_list:
        # print("case",case,"------------")
        ans = []
        for tuple in relation:
            temp = ""
            for c in case:
                temp += tuple[c]
            ans.append(temp)
        # print(ans)
                
        if len(set(ans)) == len(ans):
            # print("정답!!!!",ans)
            flag = False
            for r in result:
                # print(set(case), set(r))
                if set(r).issubset(set(case)):
                    # print("얘는 겹쳐서 안됨")
                    flag = True
                    
            if not flag:
                result.append(set(case))
                
    return len(result)