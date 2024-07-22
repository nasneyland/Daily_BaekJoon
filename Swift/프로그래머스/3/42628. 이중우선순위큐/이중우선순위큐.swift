import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var visited: [Int: Bool] = [:]
    
    var minHeap = MinHeap()
    var maxHeap = MaxHeap()
    
    for (i, operation) in operations.enumerated() {
        let input = operation.split(separator: " ")
        let action = input[0]
        let value = input[1]
        
        if action == "I" {
            let number = Int(value)!
            minHeap.push((number, i))
            maxHeap.push((number, i))
        } else if action == "D" {
            if value == "-1" {
                while !minHeap.elements.isEmpty {
                    var temp = minHeap.pop()!
                    guard let _ = visited[temp.1] else {
                        visited[temp.1] = true
                        break
                    }
                }
            } else if value == "1" {
                while !maxHeap.elements.isEmpty {
                    var temp = maxHeap.pop()!
                    guard let _ = visited[temp.1] else {
                        visited[temp.1] = true
                        break
                    }
                }
            }
        }
    }
    
    var min_value = 0
    var max_value = 0
    
    while !minHeap.elements.isEmpty {
        var temp = minHeap.pop()!
        guard let _ = visited[temp.1] else {
            min_value = temp.0
            break
        }
    }
    
    while !maxHeap.elements.isEmpty {
        var temp = maxHeap.pop()!
        guard let _ = visited[temp.1] else {
            max_value = temp.0
            break
        }
    }
    
    return [max_value, min_value]
}

//print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))

//["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]    [0,0]
//["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]    [333, -45]

class MinHeap {
    var elements: [(Int, Int)] = []
    
    func push(_ data: (Int, Int)) {
        elements.append(data)
        siftUp()
    }
    
    func pop() -> (Int, Int)? {
        if elements.count == 0 {
            return nil
        } else if elements.count == 1 {
            return elements.removeLast()
        }
        
        let temp = elements[0]
        elements[0] = elements.removeLast()
        
        if elements.count > 1 {
            siftDown()
        }
        
        return temp
    }
    
    func siftUp() {
        var child_idx = elements.count - 1
        
        
        while child_idx > 0 {
            var parent_idx = (child_idx - 1) / 2
            
            if elements[child_idx].0 >= elements[parent_idx].0 {
                return
            }
            
            elements.swapAt(child_idx, parent_idx)
            child_idx = parent_idx
        }
    }
    
    func siftDown() {
        var parent_idx = 0
        var cnt = elements.count
        
        while parent_idx < cnt {
            var left_child_idx = parent_idx * 2 + 1
            var right_child_idx = parent_idx * 2 + 2
            var temp_idx = parent_idx
            
            if left_child_idx < cnt && elements[left_child_idx].0 < elements[parent_idx].0 {
                temp_idx = left_child_idx
            }
            
            if right_child_idx < cnt && elements[right_child_idx].0 < elements[temp_idx].0 {
                temp_idx = right_child_idx
            }
            
            if parent_idx == temp_idx {
                break
            }
            
            elements.swapAt(parent_idx, temp_idx)
            parent_idx = temp_idx
        }
    }
}

class MaxHeap {
    var elements: [(Int, Int)] = []
    
    func push(_ data: (Int, Int)) {
        elements.append(data)
        siftUp()
    }
    
    func pop() -> (Int, Int)? {
        if elements.count == 0 {
            return nil
        } else if elements.count == 1 {
            return elements.removeLast()
        }
        
        let temp = elements[0]
        elements[0] = elements.removeLast()
        
        if elements.count > 1 {
            siftDown()
        }
        
        return temp
    }
    
    func siftUp() {
        var child_idx = elements.count - 1
        
        
        while child_idx > 0 {
            var parent_idx = (child_idx - 1) / 2
            
            if elements[child_idx].0 <= elements[parent_idx].0 {
                return
            }
            
            elements.swapAt(child_idx, parent_idx)
            child_idx = parent_idx
        }
    }
    
    func siftDown() {
        var parent_idx = 0
        var cnt = elements.count
        
        while parent_idx < cnt {
            var left_child_idx = parent_idx * 2 + 1
            var right_child_idx = parent_idx * 2 + 2
            var temp_idx = parent_idx
            
            if left_child_idx < cnt && elements[left_child_idx].0 > elements[parent_idx].0 {
                temp_idx = left_child_idx
            }
            
            if right_child_idx < cnt && elements[right_child_idx].0 > elements[temp_idx].0 {
                temp_idx = right_child_idx
            }
            
            if parent_idx == temp_idx {
                break
            }
            
            elements.swapAt(parent_idx, temp_idx)
            parent_idx = temp_idx
        }
    }
}
