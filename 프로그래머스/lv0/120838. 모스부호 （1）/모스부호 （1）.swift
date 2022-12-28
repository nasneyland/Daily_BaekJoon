import Foundation

func solution(_ letter:String) -> String {
    let morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    return letter.components(separatedBy: " ").map {morse.firstIndex(of: $0)!}.map{String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: $0)])}.joined()
}