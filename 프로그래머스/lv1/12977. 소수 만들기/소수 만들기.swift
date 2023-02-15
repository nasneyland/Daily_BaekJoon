import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                if isPrime(num: nums[i] + nums[j] + nums[k]) { answer += 1 }
            }
        }
    }
    return answer
}

func isPrime(num: Int) -> Bool {
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    return true
}