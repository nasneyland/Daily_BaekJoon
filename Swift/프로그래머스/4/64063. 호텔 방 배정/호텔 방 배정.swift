import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var graph = [Int64: Int64]()
    var visited = [Int64: Int64]()
    var ans = [Int64]()
    
    for room in room_number {
//        print(room, "--------------------------")
        if visited[room] == nil {
            // 비어있으면 체크인
            visited[room] = room + 1
            ans.append(room)
        } else {
            // 이미 누가 있으면 앞에서부터 빈곳에 채운다.
            var next = room
            var temp = [Int64]()
            while visited[next] != nil {
                temp.append(next)
                next = visited[next]!
            }
            
            visited[next] = next + 1
            for t in temp {
                visited[t] = next + 1
            }
            
            ans.append(next)
        }
    }
    
    return ans
}

