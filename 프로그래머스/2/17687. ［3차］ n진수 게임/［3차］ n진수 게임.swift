import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var answer = p == 1 ? "0" : ""
    var p = m == p ? 0 : p
    var currentNum = 1
    var currentIndex = 2
    
    while answer.count < t {
        let arr = Array(String(currentNum, radix: n))
        for ch in arr{
            if currentIndex % m == p {
                answer = "\(answer)\(ch.uppercased())"
            }

            currentIndex += 1

            if answer.count == t {
                break
            }
        }
        
        currentNum += 1
    }
    
    return answer
}
