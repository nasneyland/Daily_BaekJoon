import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    return String(n, radix: k).split(separator: "0").filter { number in
        let num = Int(number)!
        if num < 4 {
            return num == 1 || num == 0 ? false : true
        }
        return (2...Int(sqrt(Double(num)))).filter { num % $0 == 0 }.count == 0
    }.count
}
