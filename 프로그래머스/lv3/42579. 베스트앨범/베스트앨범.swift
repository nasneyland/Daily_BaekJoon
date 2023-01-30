import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict: [String: [[Int]]] = [:]
    
    // 딕셔너리로 같은 장르끼리 묶기
    genres.enumerated().forEach { (index, genre) in
         dict[genre, default: []] += [[index, plays[index]]]
    }
    
    // 1. 속한 노래가 많이 재생된 장르 먼저 수록합니다.
    // 2. 장르 내에서 많이 재생된 노래를 먼저 수록합니다. (같으면 고유번호 낮은 노래 먼저)
    // 3. 상위 2개 노래만 인덱스를 출력합니다
    return dict.values.sorted {
        $0.reduce(0) {$0 + $1[1]} > $1.reduce(0) {$0 + $1[1]}
    }.flatMap {
        $0.sorted {(-$0[0],$0[1]) > (-$0[0],$1[1])}
        .prefix(2).map{$0[0]}}
}