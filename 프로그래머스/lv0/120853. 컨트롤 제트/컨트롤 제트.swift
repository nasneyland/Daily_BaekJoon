import Foundation

func solution(_ s:String) -> Int {
    var strArray = s.split(separator: " ")
    while strArray.contains("Z") {
        let zIndex = strArray.firstIndex(of: "Z")!
        strArray.remove(at: zIndex)
        strArray.remove(at: strArray.index(before: zIndex))
    }
    return strArray.map{Int($0)!}.reduce(0,+)
}
