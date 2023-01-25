import Foundation

func solution(_ array:[Int]) -> Int {
    var dict: [Int: Int] = [:]
    array.forEach {dict[$0, default: 0] += 1}
    if dict.count == 1 { return array[0] }
    
    var sortedDic = dict.sorted {$0.1 > $1.1}
    return sortedDic[0].value == sortedDic[1].value ? -1 : sortedDic[0].key
}