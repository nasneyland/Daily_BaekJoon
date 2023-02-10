let input = readLine()!.split(separator: " ")
print(input.map{Int(String($0.reversed()))!}.max()!)