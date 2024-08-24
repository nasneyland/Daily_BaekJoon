import Foundation

let n = Int(readLine()!)!
let keyword = readLine()!
var dict = [Character: Int]()

// 기본 단어 딕셔너리 셋팅
for chr in keyword {
    dict[chr, default: 0] += 1
}

var cnt = 0

for _ in 0..<n-1 {
    let word = readLine()!
    
    var keyword_dict = dict
    var flag = 0
    
    for chr in word {
        if keyword_dict[chr] != nil && keyword_dict[chr]! != 0  {
            keyword_dict[chr]! -= 1
        } else {
            if flag == 1 {
                flag = 2
                break
            } else {
                flag = 1
            }
        }
    }
    
    // 기본 딕셔너리가 비어있고 flag가 바뀌지 않은 경우
    if flag <= 1 {
        if keyword_dict.filter{$0.value != 0}.isEmpty {
            cnt += 1
        } else if keyword_dict.values.reduce(0,+) == 1 {
            cnt += 1
        }
    }
}

print(cnt)