import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var numList = number.map{ Int(String($0))! }
    var result = [numList.removeFirst()]
    var removeCnt = k
    
    for (index,num) in numList.enumerated() {
        while removeCnt != 0, !result.isEmpty, result.last! < num {
            result.removeLast()
            removeCnt -= 1
        }
        // print("\(index + 1 - (k - removeCnt))...\(number.count - k)")
        // if index + 1 - (k - removeCnt) == number.count - k {
        //     break
        // }
        result.append(num)
    }
    
    return result.count != number.count - k ? result[0..<number.count - k].map{String($0)}.joined() : result.map{String($0)}.joined()
}