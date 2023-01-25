import Foundation

func solution(_ n:Int) -> [Int] {
    var number = n
    var division = 2
    var numList: [Int] = []

    while number != 1 {
        if number % division == 0 {
            numList.append(division)
            
            while number % division == 0 {
                number = number / division
            }
        }
        division += 1
    }

    return numList
}