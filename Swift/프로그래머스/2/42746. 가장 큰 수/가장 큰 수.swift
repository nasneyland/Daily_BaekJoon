
import Foundation

func solution(_ numbers:[Int]) -> String {
    if numbers.filter{ $0 != 0 }.count == 0 {
        return "0"
    }
    
    var nums = numbers.map { String($0) }
    nums.sort{$0+$1 > $1+$0}
    return nums.joined()
}