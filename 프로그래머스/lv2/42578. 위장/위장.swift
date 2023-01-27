import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var type: [String: Int] = [:]
    clothes.forEach {type[$0[1], default:1] += 1}
    return type.values.reduce(1,*) - 1
}