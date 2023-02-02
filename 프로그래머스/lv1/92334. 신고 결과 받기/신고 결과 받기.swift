import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var reportDic = [String: [String]]()
    var reportedMemberDic = [String: Int]()

    // 신고당한 회원
    Set(report).forEach {
        let reported = $0.components(separatedBy: " ")
        reportDic[reported[0], default: []].append(reported[1])
        reportedMemberDic[reported[1], default: 0] += 1
    }

    return id_list.map { id in
        return reportDic[id, default: []].reduce(0) {
            $0 + (reportedMemberDic[$1, default: 0] >= k ? 1 : 0)
        }
    }
}