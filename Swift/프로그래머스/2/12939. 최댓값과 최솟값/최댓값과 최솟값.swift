func solution(_ s:String) -> String {
    var str_list = s.split(separator: " ").map{ Int($0)! }.sorted()
    // print(str_list)
    return "\(str_list.first!) \(str_list.last!)"
}