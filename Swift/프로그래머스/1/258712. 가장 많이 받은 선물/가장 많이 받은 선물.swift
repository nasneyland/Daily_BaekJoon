import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftList = [GiftCase: Int]()
    var giftPoint = [String: Int]()
    
    for gift in gifts {
        let frds = gift.split(separator: " ")
        let from_frd = String(frds[0])
        let to_frd = String(frds[1])
        
        // 선물 주고받은 내역 계산
        giftList[GiftCase(from_frd, to_frd), default: 0] += 1
        
        // 선물지수 계산
        giftPoint[from_frd, default: 0] += 1
        giftPoint[to_frd, default: 0] -= 1
    }
    
    var cnt = friends.count
    var result = [String: Int]()
    
    for (a, frd_a) in friends.enumerated() {
        for b in a+1..<cnt {
            let frd_b = friends[b]
            
            if giftList[GiftCase(frd_a, frd_b)] ?? 0 < giftList[GiftCase(frd_b, frd_a)] ?? 0 {
                result[frd_b, default: 0] += 1
            } else if giftList[GiftCase(frd_a, frd_b)] ?? 0 > giftList[GiftCase(frd_b, frd_a)] ?? 0 {
                 result[frd_a, default: 0] += 1
            } else {
                // 주고받은게 같으면 선물지수 비교
                if giftPoint[frd_a] ?? 0 < giftPoint[frd_b] ?? 0 {
                    result[frd_b, default: 0] += 1
                } else if giftPoint[frd_a] ?? 0 > giftPoint[frd_b] ?? 0 {
                    result[frd_a, default: 0] += 1
                }
            }
        }
    }
    
    if let ans = result.values.max() {
        return ans
    } else {
        return 0
    }
}



struct GiftCase: Hashable {
    var to_frd: String
    var from_frd: String
    
    init(_ from: String, _ to: String) {
        to_frd = to
        from_frd = from
    }
}