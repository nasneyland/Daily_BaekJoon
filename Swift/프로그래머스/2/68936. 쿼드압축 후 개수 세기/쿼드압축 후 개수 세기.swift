import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    let n = arr.count
    let m = arr[0].count
    
    var num_0 = 0
    var num_1 = 0
    var minus = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] == 0 {
                num_0 += 1
            } else {
                num_1 += 1
            }
        }
    }
    
    func check(_ i: Int, _ j: Int, _ size: Int) -> Bool {
        var cnt = 0
        if i >= n && j >= m {
            return false
        }
        var k = arr[i][j]
        for dx in i..<i+size {
            for dy in j..<j+size {
                cnt += 1
                if arr[dx][dy] != k {
                    return false
                }
            }
        }
        
        if k == 1 {
            num_1 -= (cnt - 1)
        } else {
            num_0 -= (cnt - 1)
        }
        return true
    }
    
    func quad(_ i: Int, _ j: Int, _ size: Int) {
        if size == 1 {
            return
        }
        
        if check(i, j, size) {
            return
        }
        
        let newSize = size / 2
        quad(i, j, newSize)           // Top-left
        quad(i, j + newSize, newSize) // Top-right
        quad(i + newSize, j, newSize) // Bottom-left
        quad(i + newSize, j + newSize, newSize) // Bottom-right
    }
    
    quad(0,0,n)
    return [num_0, num_1]
}
