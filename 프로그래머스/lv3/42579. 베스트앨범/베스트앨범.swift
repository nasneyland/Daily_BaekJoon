import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var albumDic = [String: [[Int]]]()
    
    genres.enumerated().forEach { (index, genre) in
        albumDic[genre, default: []].append([index, plays[index]])
    }

    return albumDic.sorted{
        $0.1.reduce(0) {$0 + $1[1]} > $1.1.reduce(0) {$0 + $1[1]}
    }.flatMap {
        $0.1.sorted {$0[1]>$1[1]}.map{$0[0]}.prefix(2)
    }
}