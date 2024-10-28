import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let n = board.count
    let m = board[0].count
    
    // 1. 누적합 배열 생성
    var memo = [[Int]]()
    for _ in 0..<n+1 {
        var temp = [Int]()
        for _ in 0..<m+1 {
            temp.append(0)
        }
        memo.append(temp)
    }
    
    // 2. 공격, 회복값 넣기
    for sk in skill {
        var temp = sk[5] * (sk[0] == 1 ? -1 : 1)
        
        memo[sk[1]][sk[2]] += temp
        memo[sk[3]+1][sk[4]+1] += temp
        
        memo[sk[1]][sk[4]+1] += (temp * -1)
        memo[sk[3]+1][sk[2]] += (temp * -1)
    }
    
    // 3. 행 순회
    for i in 0..<n+1 {
        for j in 1..<m+1 {
            memo[i][j] += memo[i][j-1]
        }
    }
    
    // 4. 열 순회
    for j in 0..<m {
        for i in 1..<n {
            memo[i][j] += memo[i-1][j]
        }
    }
    
    // 5. 파괴되지 않은 건물 세기
    var cnt = 0
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] + memo[i][j] > 0 {
                cnt += 1
            }
        }
    }
    
    return cnt
}