import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var readyTruck = truck_weights
    var ongoingTruck = [[Int]]()
    
    while !(readyTruck.isEmpty && ongoingTruck.isEmpty) {
        time += 1 // 시간경과
        
        // 빼는 작업
        if !ongoingTruck.isEmpty, ongoingTruck[0][1] == bridge_length {
            ongoingTruck.removeFirst()
        }
        // 다리에 올리기
        if !readyTruck.isEmpty, ongoingTruck.reduce(0) {$0 + $1[0]} + readyTruck[0] <= weight {
            ongoingTruck.append([readyTruck.removeFirst(), 0])
        }
        // 진행작업
        ongoingTruck = ongoingTruck.map {[$0[0], $0[1] + 1]}
    }
    
    return time
}