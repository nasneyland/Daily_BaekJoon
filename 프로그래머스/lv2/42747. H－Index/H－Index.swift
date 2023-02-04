import Foundation

func solution(_ citations:[Int]) -> Int {
    var hIndex = -1
    for (index,citation) in citations.sorted(by: >).enumerated() {
        if citation == index + 1 {
            hIndex = citation
            break
        } else if citation < index + 1 {
            hIndex = index
            break
        }                                         
    }
    return hIndex == -1 ? citations.count : hIndex
}