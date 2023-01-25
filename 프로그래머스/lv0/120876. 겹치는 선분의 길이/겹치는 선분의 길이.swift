import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var dict: [Double: Int] = [:]
    lines.forEach { line in
        (line.first!...line.last! - 1).map{Double($0)+0.5}.forEach {
            dict[$0, default: 0] += 1
        }
    }
    return dict.filter {$0.1 > 1}.count
}