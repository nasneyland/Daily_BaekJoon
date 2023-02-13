let input = Int(readLine()!)!

func fac(_ n: Int) -> Int {
    if n == 0 { return 1 }
    else { return n * fac(n-1) }
}

print(fac(input))