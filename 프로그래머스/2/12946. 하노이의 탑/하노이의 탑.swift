import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result = [[Int]]()
    
    func move(_ n: Int, _ from: Int, _ to: Int, _ via: Int) {
        if n == 1 {
            result.append([from, to]) // 원판을 이동
            return
        }
        move(n - 1, from, via, to) // n-1개를 보조 기둥으로 이동
        result.append([from, to])   // 가장 큰 원판 이동
        move(n - 1, via, to, from)  // n-1개를 최종 목적지로 이동
    }
    
    move(n, 1, 3, 2)
    return result
}