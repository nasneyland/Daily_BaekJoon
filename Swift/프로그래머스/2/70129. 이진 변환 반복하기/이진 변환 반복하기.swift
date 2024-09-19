import Foundation

func solution(_ s:String) -> [Int] {
    var temp = s
    var cnt = 0
    var remove = 0
    while temp != "1" {
        cnt += 1
        var before = temp.count
        var str = temp.replacingOccurrences(of: "0", with: "")
        var after = str.count
        remove += (before - after)
        temp = String(str.count, radix : 2)
    }
    return [cnt, remove]
}