import Foundation

func solution(_ denum1:Int, _ num1:Int, _ denum2:Int, _ num2:Int) -> [Int] {
    let num = num1 * num2
    let denum = (denum1 * num2) + (denum2 * num1)
    var maximum = 1
    
    for i in 1...max(num,denum) {
        if(num%i == 0 && denum%i == 0) {
            maximum = i
        }
    }
    return [denum/maximum, num/maximum]
}