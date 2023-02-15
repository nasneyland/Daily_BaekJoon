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
    
    //조합함수
    func combi(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == 3 {
            if isPrime(nowCombi.reduce(0, +)) { cnt += 1 }
            return
        }
        for i in index..<nums.count {
            combi(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combi(0, [])
    
    return cnt
}
