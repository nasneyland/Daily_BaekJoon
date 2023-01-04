import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var answer: [Character: Int] = ["R":0,"T":0,"C":0,"F":0,"J":0,"M":0,"A":0,"N":0]

    (0..<survey.count).forEach {
        let type: [Character] = Array(survey[$0])
        
        if choices[$0] > 4 {
            answer[type[1]]! += abs(choices[$0] - 4)
        } else if choices[$0] < 4 {
            answer[type[0]]! += abs(choices[$0] - 4)
        }
    }

    let RT = answer["R"]! >= answer["T"]! ? "R" : "T"
    let CF = answer["C"]! >= answer["F"]! ? "C" : "F"
    let JM = answer["J"]! >= answer["M"]! ? "J" : "M"
    let AN = answer["A"]! >= answer["N"]! ? "A" : "N"

    return RT + CF + JM + AN
}
