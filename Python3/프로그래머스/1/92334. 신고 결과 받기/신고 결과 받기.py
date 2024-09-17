import collections

def solution(id_list, report, k):
    # key 신고받은애, value 신고한애
    graph = collections.defaultdict(set)
    result = {id: 0 for id in id_list}
    
    for rep in report:
        # 신고 한번도 안한애면 추가하기
        temp = rep.split()
        graph[temp[1]].add(temp[0])
            
    for key, value in graph.items():
        # 일정 신고횟수를 넘기면
        if len(value) >= k:
            for case in value:
                result[case] += 1
    
    return list(result.values())