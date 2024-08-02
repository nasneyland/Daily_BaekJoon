struct Visit: Hashable {
    var a: Int
    var b: Int
    
    init(_ a: Int, _ b: Int) {
        self.a = a
        self.b = b
    }
}

// 1. input 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var board:[[Int]] = []
for _ in 0..<n {
    let input_list = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input_list)
}

// 빈공간, 바이러스 리스트 받기
var empty_list: [(Int, Int)] = []
var virus_list: [(Int, Int)] = []
var safe_cnt = 0

for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == 0 {
            empty_list.append((i, j))
            safe_cnt += 1
        } else if board[i][j] == 2 {
            virus_list.append((i,j))
        }
    }
}

// 조합 함수 (3개씩 묶기)
func combinations(_ array: [(Int, Int)], _ k: Int) -> [[(Int, Int)]]{
    var result: [[(Int, Int)]] = []
    var cnt = array.count
    
    func backtracking(_ start: Int, _ ans: inout [(Int, Int)]) {
        if ans.count == k {
            result.append(ans)
            return
        }
        
        for i in start..<cnt {
            ans.append(array[i])
            backtracking(i+1, &ans)
            ans.removeLast()
        }
    }
    
    var ans: [(Int, Int)] = []
    backtracking(0, &ans)
    return result
}

let dir4 = [(0,1),(0,-1),(1,0),(-1,0)]
var max_result = 0

// 빈공간 3개를 선택하는 경우의 수
let case_list = combinations(empty_list, 3)

for cases in case_list {
    var queue: [(Int, Int)] = []
    var safe = safe_cnt - 3
    var map = board
    
    // (예비) 벽 세우기
    for ca in cases {
        map[ca.0][ca.1] = 1
    }
    
    for virus in virus_list {
        queue.append(virus)
    }
    
    while !queue.isEmpty {
        var (i,j) = queue.removeFirst()
        
        for d in dir4 {
            let dx = i + d.0
            let dy = j + d.1
            
            if 0<=dx && dx<n && 0<=dy && dy<m && map[dx][dy] == 0 {
                queue.append((dx,dy))
                map[dx][dy] = 9
                safe -= 1
            }
        }
    }
    
    max_result = max(max_result, safe)
}

print(max_result)

//7 7
//2 0 0 0 1 1 0
//0 0 1 0 1 2 0
//0 1 1 0 1 0 0
//0 1 0 0 0 0 0
//0 0 0 0 0 1 1
//0 1 0 0 0 0 0
//0 1 0 0 0 0 0

//27