import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.replacingOccurrences(of: "- ", with: "-").replacingOccurrences(of: "+ ", with: "+").split(separator:" ").map{Int(String($0))!}.reduce(0,+)
}