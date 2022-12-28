import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    return (1...cipher.count).filter{ $0 % code == 0 }.map{String(cipher[cipher.index(cipher.startIndex, offsetBy: ($0-1))])}.joined()
}