import Foundation

func solution(_ nums:[Int]) -> Int {
    var cnt = 0
    
    //소수판별함수
    func isPrime(_ num: Int) -> Bool {
        if num < 4 { return num == 2 || num == 3 ? true : false } 
        
        for n in (2...Int(sqrt(Double(num)))) {
            if num % n == 0 { return false }
        }
        return true
    }
    
    // 3가지 조합
    for (iIndex, i) in nums[0...nums.count-3].enumerated() {
        for (jIndex, j) in nums[iIndex+1...nums.count-2].enumerated() {
            for k in nums[iIndex+jIndex+2...nums.count-1] {
                if isPrime(i+j+k) { cnt += 1 }
            }
        }
    }
    
    return cnt
}
