import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = Set<String>()
    let cases = permutation(user_id, banned_id.count)
    
    for c in cases {
        var user_cnt = 0
        for i in 0..<banned_id.count {
            var cnt = 0
            if banned_id[i].count == c[i].count {
                var ban_list = Array(banned_id[i])
                var usr_list = Array(c[i])
                for j in 0..<banned_id[i].count {
                    if ban_list[j] == "*" || ban_list[j] == usr_list[j] {
                        cnt += 1
                    }
                }
            }

            if cnt == banned_id[i].count {
                user_cnt += 1
            }
        }
        
        if user_cnt == banned_id.count {
            result.insert(c.sorted().joined())
        }
    }
    return result.count
}

func permutation(_ list: [String], _ n: Int) -> [[String]] {
    var result = [[String]]()
    func backtraking(_ ans: inout [String]) {
        if ans.count == n {
            result.append(ans)
            return
        }
        
        for (i, l) in list.enumerated() {
            if !visited[i] {
                visited[i] = true
                ans.append(l)
                backtraking(&ans)
                visited[i] = false
                ans.removeLast()
            }
        }
    }
    
    var ans = [String]()
    var visited = Array(repeating: false, count: list.count)
    backtraking(&ans)
    return result
}