let input = readLine()!.split(separator: " ").map{Int($0)!}
var cnt: Int?

for (i, num) in input.enumerated() {
    if i == 0 {
        cnt = input[i+1] - num
    } else if i == input.count - 1 {
        print(cnt == 1 ? "ascending" : "descending")
    } else if input[i+1] - num != cnt {
        print("mixed")
        break
    }
}