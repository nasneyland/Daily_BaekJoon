func solution(_ num:Int) -> Int {
    var n = num
    var cnt = 0
    while n != 1 && cnt != 500 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n = (n * 3) + 1
        }
        cnt += 1
    }

    return cnt == 500 ? -1 : cnt
}