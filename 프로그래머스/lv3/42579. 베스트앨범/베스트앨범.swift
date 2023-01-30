import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playsDic: [Int: (String, Int)] = [:]
    var genresDic: [String: Int] = [:]
    
    // 장르와 곡 딕셔너리 선언
    (0...genres.count-1).forEach { 
        genresDic[genres[$0], default: 0] += plays[$0] 
        playsDic[$0] = (genres[$0], plays[$0])
    }
    
    // 장르와 곡 정렬
    let sortedGenres = genresDic.sorted {$0.1 > $1.1}
    let sortedPlays = playsDic.sorted {($0.1.1, -$0.0) > ($1.1.1, -$1.0)}
    
    var result: [Int] = []
    for (i, genre) in sortedGenres.enumerated() {
        for song in sortedPlays {
            if result.count != (i+1) * 2 {
                if song.value.0 == genre.key {
                    result.append(song.key)
                }
            } else {
                break
            }
        }
    }
    
    return result
}