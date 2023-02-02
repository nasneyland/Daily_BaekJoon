import Foundation

func solution(_ n:Int, _ k:Int) -> Int {

    func isPrime(_ num: Int) -> Bool {
        if(num<4) {
            return num == 1 || num == 0 ? false : true
        }
        for i in 2...Int(sqrt(Double(num))) {
            if (num % i == 0) { return false }
        }
        return true
    }
    
    return String(n, radix: k).split(separator: "0").filter {
        return isPrime(Int($0)!)
    }.count
}