import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result = 0
    
    var idx = 0
    while idx <= d {
        
        let ans = sqrt(Double(d * d) - Double(idx * idx))
        result += Int(ans / Double(k)) + 1
        
        idx += k
    }
    return Int64(result)
}