func solution(_ msg:String) -> [Int] {
    let chr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    var last_idx = 1
    var str_dict = [String: Int]()
    
    for c in chr {
        str_dict[String(c)] = last_idx
        last_idx += 1
    }
    
    var stack: [String] = []
    var result: [Int] = []
    
    for str in msg {
        stack.append(String(str))
        
        let new_str = stack.joined()
        
        if str_dict[new_str] == nil {
            str_dict[new_str] = last_idx
            last_idx += 1
            
            let temp = stack.removeLast()
            result.append(str_dict[stack.joined()]!)
            stack = [temp]
        }
    }
    
    result.append(str_dict[stack.joined()]!)
    return result
}