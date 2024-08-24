import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var day_list: [Int] = []
    for (idx, progress) in progresses.enumerated() {
        let days = Int(ceil(Double(100 - progress) / Double(speeds[idx])))
//        print(days)
        day_list.append(days)
    }
    
    var days: [Int] = []
    var result: [Int] = []
    
    for day in day_list {
//        print(days, result)
        let days_cnt = days.count
        
        if days_cnt == 0 {
            days.append(day)
            result.append(1)
        } else {
            if days[days_cnt - 1] >= day {
                result[days_cnt - 1] += 1
            } else {
                days.append(day)
                result.append(1)
            }
        }
        
    }
    
    return result
}