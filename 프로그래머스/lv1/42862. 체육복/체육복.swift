import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var studentList = Array(repeating: 1, count: n)
    
    lost.forEach {studentList[$0 - 1] -= 1}
    reserve.forEach {studentList[$0 - 1] += 1}
    
    studentList.enumerated().forEach { (index, student) in
        if index != 0, student == 0, studentList[index - 1] == 2 {
            studentList[index - 1] -= 1
            studentList[index] += 1
            return
        }
        if index != studentList.count - 1, student == 0, studentList[index + 1] == 2 {
            studentList[index + 1] -= 1
            studentList[index] += 1
            return
        }
    }
    
    return studentList.filter {$0 >= 1}.count
}
