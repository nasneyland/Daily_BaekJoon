let numbers = readLine()!.split(separator: " ").map{Int($0)!}
print(numbers.reduce(1,*))