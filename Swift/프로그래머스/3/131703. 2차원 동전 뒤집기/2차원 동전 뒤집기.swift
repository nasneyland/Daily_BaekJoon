import Foundation

func solution(_ beginning:[[Int]], _ target:[[Int]]) -> Int {
    let n = beginning.count
    let m = beginning[0].count
    
    // 조합만들기
    func combinations(_ k: Int) -> [[Int]] {
        var result = [[Int]]()
        func backtracking(_ i: Int, _ ans: inout [Int]) {
            result.append(ans)
            
            for j in i..<k {
                ans.append(j)
                backtracking(j+1, &ans)
                ans.popLast()
            }
        }
        
        var ans = [Int]()
        backtracking(0, &ans)
        return result
    }
    
    // 같은지 확인하기
    func isEqual(_ list1: [[Int]], _ list2: [[Int]]) -> Bool {
        for i in 0..<n {
            for j in 0..<m {
                if list1[i][j] != list2[i][j] {
                    return false
                }
            }
        }
        
        return true
    }
    
    func reverseRow(_ coins: inout [[Int]], _ row: Int) {
        for i in 0..<m {
            coins[row][i] = coins[row][i] == 1 ? 0 : 1
        }
    }
    
    func reverseCol(_ coins: inout [[Int]], _ col: Int) {
        for i in 0..<n {
            coins[i][col] = coins[i][col] == 1 ? 0 : 1
        }
    }
    
    var row_cases = combinations(n)
    var col_cases = combinations(m)
    var min_cnt = -1
    
    for row_case in row_cases {
        var row_temp = beginning
//        print(row_temp)
        
        // 행 뒤집기
        for row in row_case {
            reverseRow(&row_temp, row)
        }
//        print(row_temp)
        
        for col_case in col_cases {
            var temp = row_temp
            for col in col_case {
                reverseCol(&temp, col)
            }
            
//            print(row_case, col_case, temp, target)
            
            if isEqual(temp, target) {
//                print("Equal!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                let cnt = row_case.count + col_case.count
                if min_cnt == -1 {
                    min_cnt = cnt
                } else {
                    min_cnt = min(min_cnt, cnt)
                }
            }
        }
    }
    
    return min_cnt
}