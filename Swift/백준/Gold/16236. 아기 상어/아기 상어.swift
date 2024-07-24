import Foundation

struct Visit: Hashable {
    var i: Int
    var j: Int
    
    init(_ visit: (Int, Int)) {
        self.i = visit.0
        self.j = visit.1
    }
}

let dir4 = [(0,1),(0,-1),(1,0),(-1,0)]
let n = Int(readLine()!)!

var board:[[Int]] = []
var shark_point = (0,0,0)
var total_fish_cnt = 0
for i in 0..<n {
    var input_list = readLine()!.split(separator: " ").map{ Int($0)! }
    for (j, input_value) in input_list.enumerated() {
        if input_value == 9 {
            input_list[j] = 0
            shark_point = (i,j,0)
        } else if input_value != 0 {
            total_fish_cnt += 1
        }
    }
    board.append(input_list)
}

let m = board[0].count
var shark_size = 2
var shark_level = 0
var ans = 0

// 물고기가 있는 한 계속 반복
while total_fish_cnt > 0 {
//    print("==============")
    var queue: [(Int, Int, Int)] = []
    var visited = Set<Visit>()
    
    queue.append(shark_point)
    visited.insert(Visit((shark_point.0, shark_point.1)))
    
    var target_depth = Int.max
    var fish_cand_list: [(Int, Int)] = []

    while !queue.isEmpty {
        let (x,y,depth) = queue.removeFirst()
//        print(x,y)
        
        if board[x][y] != 0 && shark_size > board[x][y] && depth <= target_depth {
//            print("add", shark_size, board[x][y])
            fish_cand_list.append((x,y)) // 물고기 후보에 추가
            target_depth = depth // 현재 뎁스 저장
        }
        
        for d in dir4 {
            let dx = x + d.0
            let dy = y + d.1
            
            if 0<=dx && dx<n && 0<=dy && dy<m && !visited.contains(Visit((dx,dy))) && shark_size >= board[dx][dy] && depth <= target_depth {
                queue.append((dx,dy,depth+1))
                visited.insert(Visit((dx,dy)))
            }
        }
    }
    
    fish_cand_list.sort{ $0.1 < $1.1 }
    fish_cand_list.sort{ $0.0 < $1.0 }
    
    guard let (i,j) = fish_cand_list.first else { break }
//    print("     eat",i,j,target_depth)
    
    // 상어 위치 이동
    shark_point = (i, j, 0)
    ans += target_depth
    
    // 물고기 먹기
    board[i][j] = 0
    total_fish_cnt -= 1
    
    // 상어 누적레벨 up
    shark_level += 1
    if shark_size == shark_level {
        shark_size += 1
        shark_level = 0
    }
}

print(ans)