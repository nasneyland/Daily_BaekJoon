import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var carDic = [String: [[String]]]()
    
    // 차량 별 입출차 정보 딕셔너리에 담기
    records.forEach { record in
        let car = record.components(separatedBy: " ")
        if car[2] == "OUT" {
            carDic[car[1]]![carDic[car[1]]!.count-1].append(car[0])
        } else if carDic[car[1]] == nil {
            carDic[car[1]] = [[car[0]]]
        } else {
            carDic[car[1]]!.append([car[0]])
        }
    }
    
     // 시각 사이의 시간을 구해주는 함수
     func timeInterval(_ start: String, _ end: String) -> Int {
         let s = start.split(separator: ":").map{Int($0)!}
         let e = end.split(separator: ":").map{Int($0)!}
         return ((e[1] + e[0] * 60)-(s[1] + s[0] * 60))
     }
    
     // 시간 별 요금
     func timeFee(_ time: Int) -> Int {
         if time <= fees[0] {
             return fees[1]
         } else {
             return fees[1] + (Int(ceil(Double(time - fees[0]) / Double(fees[2]))) * fees[3])
         }
     }
    
    return carDic.sorted{$0.0 < $1.0}.map { onoff in
         return timeFee(onoff.1.map {timeInterval($0[0], $0.count == 1 ? "23:59" : $0[1])}.reduce(0, +))
     }
}