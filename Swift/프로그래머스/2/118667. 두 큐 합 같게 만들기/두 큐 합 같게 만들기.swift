import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = Queue()
    q1.elements = queue1
    var sum1 = queue1.reduce(0,+)
    
    var q2 = Queue()
    q2.elements = queue2
    var sum2 = queue2.reduce(0,+)
    
    var total = (queue1.count + queue2.count) * 2
    var cnt = 0
    
    while sum1 != sum2 && cnt <= total {
        cnt += 1
        if sum1 > sum2 {
            var temp = q1.popLeft()
            q2.append(temp)
            
            sum1 -= temp
            sum2 += temp
        } else {
            var temp = q2.popLeft()
            q1.append(temp)
            
            sum2 -= temp
            sum1 += temp
        }
    }
    
    if sum1 == sum2 {
        return cnt
    } else {
        return -1
    }
}

class Queue {
    var elements = [Int]()
    var head = 0
    
    func popLeft() -> Int {
        var temp = elements[head]
        head += 1
        return temp
    }
    
    func append(_ data: Int) {
        elements.append(data)
    }
}