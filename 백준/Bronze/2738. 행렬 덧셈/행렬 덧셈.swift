let inputSize = readLine()!.split(separator: " ")
let xSize = Int(inputSize[1])!
let ySize = Int(inputSize[0])!
var matrix = [[Int]]()

for _ in (1...ySize).enumerated() {
    matrix.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for (yIndex, y) in (1...ySize).enumerated() {
    readLine()!.split(separator: " ").map{Int($0)!}.enumerated().forEach { (xIndex, num) in
        matrix[yIndex][xIndex] += num
    }
}

matrix.forEach {
    print($0.map{String($0)}.joined(separator: " "))
}
