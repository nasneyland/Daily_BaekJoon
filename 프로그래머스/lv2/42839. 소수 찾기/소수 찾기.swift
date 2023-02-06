import Foundation

func solution(_ numbers:String) -> Int {
    
    // 모든 조합 - 순열
    func permutation(_ array: [String]) -> Set<String> {
        let permutatedArray = (0..<array.count).flatMap { i -> [String] in
            var removedArray = array
            let elem = removedArray.remove(at: i)
            return [elem] + permutation(removedArray).map { elem + $0}
        }
        
        return Set(permutatedArray)
    }
    
    // 소수 판별
    func isPrime(_ num: Int) -> Bool {
        if num < 4 { return num == 2 || num == 3 ? true : false}
        for i in (2...Int(sqrt(Double(num)))) {
            if (num % i == 0) { return false } 
        }
        return true
    }
    
    return Set(permutation(numbers.map{String($0)}).map{Int($0)!}).filter{isPrime($0)}.count
}