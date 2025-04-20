import Foundation

let t = Int(readLine()!)!
var results: [Int] = []

for _ in 0..<t {
    let _ = Int(readLine()!)! // 동전 개수
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let target = Int(readLine()!)! // 목표 금액

    // dp[i] = i원을 만드는 방법의 수
    var dp = Array(repeating: 0, count: target + 1)
    dp[0] = 1 // 0원을 만드는 방법은 아무것도 안 쓰는 1가지

    for coin in coins {
        if coin > target { continue }
        for i in coin...target {
            dp[i] += dp[i - coin]
        }
    }
    
    results.append(dp[target])
}

results.forEach {
    print($0)
}