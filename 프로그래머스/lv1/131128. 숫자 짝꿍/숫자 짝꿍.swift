import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xDic = [Character: Int]()
    var yDic = [Character: Int]()
    var resultDic = [Character: Int]()
    
    X.forEach {xDic[$0, default: 0] += 1}
    Y.forEach {yDic[$0, default: 0] += 1}
    
    xDic.forEach {
        let minValue = min(yDic[$0.0, default: 0], $0.1)
        if minValue != 0 {resultDic[$0.0, default: 0] = min(yDic[$0.0, default: 0], $0.1)}
    }
    if (resultDic.isEmpty) {return "-1"}
    else if (resultDic.count == 1 && resultDic.filter{$0.0 != "0"}.isEmpty) {return "0"}
    else {
        return resultDic.sorted {$0.0 > $1.0}.map{String(repeating: $0.0, count: $0.1)}.joined()
    }
}