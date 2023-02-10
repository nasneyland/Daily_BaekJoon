func inputString() -> String {
    return readLine()!
}

print(solution())

func solution() -> String {
    var dic = [String: Int]()
    inputString().forEach {
        dic[String($0).uppercased(), default: 0] += 1
    }
    
    let sortedDic = dic.sorted{$0.1 > $1.1}
    return sortedDic.count > 1 && sortedDic[0].1 == sortedDic[1].1 ? "?" : sortedDic[0].0
}