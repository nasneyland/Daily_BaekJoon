import Foundation

func solution(_ name:String) -> Int {
    let zValue = Character("Z").asciiValue!
    let aValue = Character("A").asciiValue!
    
    var updown = 0
    var leftright = name.count - 1
    
    var nameList = name.map {String($0)}
    var startIdx = 0
    var endIdx = 0
    
    name.forEach { 
        let nameValue = $0.asciiValue!
        updown += min(Int(zValue - nameValue + 1), Int(nameValue - aValue))
    }
    
    while startIdx < nameList.count {
        if nameList[startIdx] == "A" {
            endIdx = startIdx
            while endIdx < nameList.count - 1, nameList[endIdx + 1] == "A" {
                endIdx += 1
            }
            
            if startIdx <= 1 && endIdx == name.count - 1 {
                leftright = 0
            } else {
                let turnLeft = (startIdx <= 1 ? 0 : (startIdx - 1) * 2) + (name.count - endIdx - 1)
                let turnRight = (startIdx) + ((name.count - endIdx - 1) * 2 - 1)
                leftright = min(leftright, turnLeft, turnRight)
            }
            startIdx = endIdx + 1
        } else {
            startIdx += 1
        }
    }
    
    return updown + leftright
}