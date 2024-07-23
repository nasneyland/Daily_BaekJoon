import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var cur_time = 0
    var job_list = jobs
    job_list.sort { $0[0] > $1[0] }
    
    var ans = 0
    
    var heap = Heap()
    
    while !job_list.isEmpty || !heap.elements.isEmpty {
        
        // 현재 시간에 가능한 job들 추가
        while !job_list.isEmpty {
            if job_list.last![0] <= cur_time {
                let cur = job_list.removeLast()
                heap.push((cur[1], cur[0]))
            } else {
                break
            }
        }
        
        // 작업 시작
        if !heap.elements.isEmpty {
            let cur = heap.pop()!
            let cur_start = cur.1
            let cur_cost = cur.0
            
            cur_time += cur_cost
            ans += (cur_time - cur_start)
        } else {
            cur_time += 1
        }
    }
    
    return ans / jobs.count
}

class Heap {
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
