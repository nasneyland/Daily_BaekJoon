let input = readLine()!.split(separator: " ").map{Int($0)!}
print(input.reduce(0,+))