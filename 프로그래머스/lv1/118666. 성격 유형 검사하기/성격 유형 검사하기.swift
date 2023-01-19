import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var types: [String: Int] = [:]
    
    for (index,choice) in choices.enumerated() {
        let key = String(survey[index].prefix(1))
        types[key] = types[key, default: 0] + (4 - choice)
    }
    
    let RT = types["R", default: 0] >= types["T", default: 0] ? "R" : "T"
    let CF = types["C", default: 0] >= types["F", default: 0] ? "C" : "F"
    let JM = types["J", default: 0] >= types["M", default: 0] ? "J" : "M"
    let AN = types["A", default: 0] >= types["N", default: 0] ? "A" : "N"
    
    return RT+CF+JM+AN
}