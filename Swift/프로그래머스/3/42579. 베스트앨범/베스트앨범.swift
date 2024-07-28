import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genre_cnt: [String: Int] = [:]
    var genre_songs: [String: [(Int, Int)]] = [:]
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]
        
        genre_cnt[genre, default: 0] += play
        genre_songs[genre, default: []].append((i, play))
    }
    
    var ans: [Int] = []
    // print(genre_cnt.sorted { $0.1 > $1.1 })
    for genre in genre_cnt.sorted { $0.1 > $1.1 }.map { $0.0 } {
        // print(genre)
        let songs = genre_songs[genre]!.sorted { $0.0 < $1.0 }.sorted { $0.1 > $1.1 }
        
        for i in 0...1 {
            if songs.count > i {
                ans.append(songs[i].0)
            }
        }
    }
    
    return ans
}