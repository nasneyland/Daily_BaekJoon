import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    let number = (numer1*denom2)+(numer2*denom1)
    let denom = denom1*denom2
    let max = (1...[number, denom].min()!).filter {number % $0 == 0 && denom % $0 == 0}.max()!
    return [number / max, denom / max]
}