import Foundation

func solution(_ n: Int, _ k: Int) -> Int {
    var n = n
    var num = ""
    var answer = 0
    
    while n > 0 {
        num = "\(n % k)\(num)"
        n /= k
    }
    
    let primeArr = num.split(separator: "0").compactMap { Int($0) }
    
    for num in primeArr {
        if isPrimeNumber(num) {
            answer += 1
        }
    }
    
    return answer
}

func isPrimeNumber(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true } // 2는 유일한 짝수 소수
    if n % 2 == 0 { return false } // 2를 제외한 모든 짝수는 소수가 아님

    let sqrtN = Int(Double(n).squareRoot()) // 루트(n)까지만 검사
    for i in stride(from: 3, through: sqrtN, by: 2) {
        if n % i == 0 {
            return false
        }
    }
    return true
}
