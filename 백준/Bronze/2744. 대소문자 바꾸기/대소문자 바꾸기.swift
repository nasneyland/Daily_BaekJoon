print(readLine()!.map{String($0) == String($0).uppercased() ? String($0).lowercased() : String($0).uppercased()}.joined())