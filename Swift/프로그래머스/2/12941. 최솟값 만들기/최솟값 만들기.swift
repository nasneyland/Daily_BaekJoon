import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
  var arrayA = A.sorted()
  var arrayB = B.sorted()
    
  var num = A.count
  var sum = 0
  
  for i in 0..<num {
    sum += arrayA[i] * arrayB[num-i-1]
  }
  
  return sum
}