import Foundation

func solution(_ record:[String]) -> [String] {
    var dict = [String: String]()
    var result = [(String, String)]()
    
    for cases in record {
        let c = cases.split(separator: " ").map{String($0)}
        
        if c[0] == "Enter" {
            dict[c[1]] = c[2]
            result.append(("들어왔습니다.", c[1]))
        } else if c[0] == "Leave" {
            result.append(("나갔습니다.", c[1]))
        } else if c[0] == "Change" {
            dict[c[1]] = c[2]
        }
    }
    return result.map { "\(dict[$0.1]!)님이 \($0.0)"}
}