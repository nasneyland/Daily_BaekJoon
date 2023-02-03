import Foundation

func solution(_ balls:Int, _ share:Int) -> Int {
    let ball = Double(((balls - share + 1)...balls).reduce(1) { Double($0) * Double($1) })
    let shares = Double((1...share).reduce(1) { Double($0) * Double($1) })
    return Int(round( ball / shares ))
}