import Foundation

// 백준 16194 카드 구매하기 2

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1001, count: n + 1)

dp[1] = arr[0]

for i in 2...n {
    dp[i] = arr[i - 1]
    for j in 1...i {
        dp[i] = min(dp[i], dp[i - j] + arr[j - 1])
    }
}

print(dp[n])