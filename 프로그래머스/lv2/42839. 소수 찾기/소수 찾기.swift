import Foundation

func solution(_ numbers:String) -> Int {
    
    // 순열
    func permutation(_ array: [String]) -> [String] {
    if array.count == 0 { return [] }

    let answerArray = (0..<array.count).flatMap { i -> [String] in
        var removedArray = array
        let elem = removedArray.remove(at: i)
        return [elem] + permutation(removedArray).map { elem + $0 }
    }

    return answerArray
}
    
    // 소수판별
    func isPrime(_ num: Int) -> Bool {
        print(num)
        if(num<4) {
            return num == 1 || num == 0 ? false : true
        }
        for i in 2...Int(sqrt(Double(num))) {
            if (num % i == 0) { return false }
        }
        return true
    }
    
    return Set(permutation(numbers.map {String($0)}).map{Int($0)!}).filter {isPrime($0)}.count
}