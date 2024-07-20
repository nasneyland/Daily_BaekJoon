import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var map = Array(repeating: 0, count: N+2)
    for stage in stages {
        map[stage] += 1
    }
    
    let total_person = stages.count
    var cnt = 0
    var ans: [(Int, Double)] = []
    
    for (i, m) in map.enumerated() {
        if i != 0 && i <= N {
            var cur_all_person = total_person - cnt
            var not_pass_person = m
            
            cnt += m
            
            if cur_all_person == 0 {
                ans.append((i, 0.0))
            } else {
                ans.append((i, Double(not_pass_person) / Double(cur_all_person)))
            }
        } 
    }
    
    var result: [Int] = []
    var sorted_ans = ans.sorted { $0.1 > $1.1 }

    for a in sorted_ans {
        result.append(a.0)
    }
    
    return result
}