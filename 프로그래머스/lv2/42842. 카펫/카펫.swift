import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let line = ((brown-4)/2)
    var top = 0
    (1...Int(ceil(Double(line)/2))).forEach {
        print($0)
        if $0 * (line - $0) == yellow {
            top = $0
        }
    }
    return [top + 2, line - top + 2].sorted(by: >)
}