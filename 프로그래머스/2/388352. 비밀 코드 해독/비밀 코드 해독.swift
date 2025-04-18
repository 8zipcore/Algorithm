import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    var combinations: [Int] = .init()
    let questionsCnt: Int = q.count
    var cnt: Int = 0

    func backtracking(_ idx: Int) {
        if combinations.count == 5 {
            if isVaild(combinations) {
                cnt += 1
            }
            return
        }

        if idx > n {
            return
        }

        for i in idx...n {
            combinations.append(i)
            backtracking(i + 1)
            combinations.removeLast()
        }
    }

    func isVaild(_ comb: [Int]) -> Bool {
        for index in 0..<questionsCnt {
            let predict = q[index].filter { comb.contains($0) }.count
            if predict != ans[index] {
                return false
            }
        }
        return true
    }

    backtracking(1)

    return cnt
}

