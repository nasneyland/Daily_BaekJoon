import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let free = n / 10
    return (n * 12000) + ((k-free) * 2000)
}