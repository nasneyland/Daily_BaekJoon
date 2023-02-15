import Foundation

func solution(_ number:[Int]) -> Int {
    var cnt = 0
    
    //조합함수
    func combi(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == 3 {
            if (nowCombi.reduce(0, +) == 0) { cnt += 1 }
            return
        }
        for i in index..<number.count {
            combi(i + 1, nowCombi + [number[i]])
        }
    }
    
    combi(0, [])
    
    return cnt
}