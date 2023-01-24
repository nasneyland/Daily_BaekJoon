import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    // 1. 기약분수 나타내기
    let fraction = b / (1...a).filter{a % $0 == 0 && b % $0 == 0}.max()!
    // 2. 분모의 소인수 구하기
    let divisionList = (1...fraction).filter {fraction % $0 == 0}
    let canDivisionList = divisionList.filter {$0 % 2 == 0 || $0 % 5 == 0}
    return divisionList.count - 1 == canDivisionList.count ? 1 : 2
}