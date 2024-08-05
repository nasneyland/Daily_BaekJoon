import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var cloth_dict = [String: Int]()
    for cloth in clothes {
        cloth_dict[cloth[1], default: 0] += 1
    }
    
    return cloth_dict.values.reduce(1) {$0 * ($1 + 1)} - 1
}