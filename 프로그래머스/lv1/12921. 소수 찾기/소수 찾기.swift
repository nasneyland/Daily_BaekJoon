import Foundation

func solution(_ n:Int) -> Int {
    func isPrime(_ num: Int) -> Bool {
        if num < 4 { return num == 2 || num == 3 ? true : false } 

        for n in (2...Int(sqrt(Double(num)))) { if (num % n == 0) { return false } }
        return true
    }
    
    return (2...n).filter {isPrime($0)}.count
}