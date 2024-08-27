import Foundation

func solution(_ n:Int) -> [Int] {
    
    // 기본 골격 만들기
    var answer = [[Int]]()
    for i in 0..<n {
        answer.append(Array(repeating: 0, count: i+1))
    }
    
    var x = -1
    var y = 0
    var num = 1
    
    for i in 0..<n {
        for j in i..<n {
            if i % 3 == 0 {
                x += 1 // 아래로
            } else if i % 3 == 1 {
                y += 1 // 오른쪽으로
            } else {
                // 위쪽으로
                x -= 1
                y -= 1
            }
            answer[x][y] = num
            num += 1
        }
    }
    
    var result = [Int]()
    for ans in answer {
        for a in ans {
            result.append(a)
        }
    }
    
    return result
}