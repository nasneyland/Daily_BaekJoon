import Foundation

func solution(_ babbling:[String]) -> Int {
    
    let wordList = ["aya", "ye", "woo", "ma"]
    
    return babbling.compactMap { word -> String in
        var replacedWord = word
        
        wordList.forEach {
            replacedWord = replacedWord.replacingOccurrences(of: $0, with: "9")
        }
        
        return replacedWord
    }.compactMap {Int($0)}.count
}